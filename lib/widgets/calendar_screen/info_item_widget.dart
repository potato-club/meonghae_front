import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/controllers/calendar_edit_controller.dart';
import 'package:meonghae_front/models/calendar_model.dart';
import 'package:meonghae_front/screens/calendar_edit_screen.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/alarm.dart';
import 'package:meonghae_front/widgets/svg/bell.dart';

class InfoItemWidget extends StatelessWidget {
  final CalendarDetailModel data;
  final bool isEnd;
  const InfoItemWidget({super.key, required this.data, required this.isEnd});

  @override
  Widget build(BuildContext context) {
    String? formatTime(String? time) {
      if (time != null) {
        DateTime dateTime = DateTime.parse(time);
        String formattedTime = DateFormat('a hh:mm', 'ko_KR').format(dateTime);
        formattedTime =
            formattedTime.replaceAll('AM', '오전').replaceAll('PM', '오후');
        return formattedTime;
      } else {
        return null;
      }
    }

    String? calculateDayDifference(String scheduleTime, String? alarmTime) {
      if (alarmTime != null) {
        int diff = DateFormat("yyyy-MM-ddTHH:mm:ss")
            .parse(alarmTime)
            .difference(DateFormat("yyyy-MM-ddTHH:mm:ss").parse(scheduleTime))
            .inDays;
        var alarmDay = '';
        Get.find<CalendarController>().alarmList.forEach((key, value) {
          if (value == diff) {
            alarmDay = key;
          }
        });
        return alarmDay;
      } else {
        return null;
      }
    }

    var alarmDay = calculateDayDifference(data.scheduleTime, data.alarmTime);
    return GestureDetector(
      onTap: () => Get.find<CalendarEditController>().goEditScreen(data),
      child: Container(
        decoration: BoxDecoration(
          border: isEnd
              ? null
              : const Border(
                  bottom: BorderSide(
                    color: CustomColor.lightGray1,
                    width: 1,
                  ),
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 74,
                child: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(
                              width: 1, color: CustomColor.lightGray1))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const AlarmSVG(),
                            const SizedBox(width: 4),
                            Text(
                              formatTime(data.scheduleTime)!,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: CustomColor.black2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        if (alarmDay != null)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 1),
                                child: BellSVG(),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '$alarmDay 알림,\n${formatTime(data.alarmTime)}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: CustomColor.lightGray2,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88 - 102,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.scheduleType == 'Custom'
                            ? data.customScheduleTitle!
                            : data.scheduleType,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.black2,
                        ),
                      ),
                      if (data.text != null)
                        Padding(
                          padding: const EdgeInsets.only(top: 6),
                          child: Text(
                            data.text!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: CustomColor.gray,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
