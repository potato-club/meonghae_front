import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/models/calendar_model.dart';
import 'package:meonghae_front/themes/customColor.dart';

class SearchItemWidget extends StatelessWidget {
  final CalendarDetailModel eventDetail;
  const SearchItemWidget({super.key, required this.eventDetail});

  String parseDate(String input) {
    DateTime dateTime = DateTime.parse(input);
    String formattedDate = DateFormat('M월 d일 E요일', 'ko_KR').format(dateTime);
    return formattedDate;
  }

  String parseTime(String time) {
    DateTime dateTime = DateTime.parse(time);
    String formattedTime = DateFormat('a hh:mm', 'ko_KR').format(dateTime);
    formattedTime = formattedTime.replaceAll('AM', '오전').replaceAll('PM', '오후');
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(parseDate(eventDetail.scheduleTime),
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 6),
          Container(
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 14, top: 18, bottom: 28, right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 20,
                        decoration: BoxDecoration(
                            color: CustomColor.brown1,
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 70,
                        child: Text(parseTime(eventDetail.scheduleTime),
                            style: const TextStyle(
                                fontSize: 14, color: CustomColor.gray)),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.88 - 112,
                        child: Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text: '${eventDetail.petName}의 ',
                                  style: const TextStyle(
                                      fontSize: 14, color: CustomColor.gray),
                                ),
                                TextSpan(
                                  text: eventDetail.scheduleType == 'Custom'
                                      ? eventDetail.customScheduleTitle
                                      : eventDetail.scheduleType,
                                  style: const TextStyle(
                                      fontSize: 14, color: CustomColor.brown1),
                                ),
                              ],
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 30,
                      child: Text(
                        eventDetail.text ?? '',
                        style: const TextStyle(
                            fontSize: 13, color: CustomColor.gray),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
