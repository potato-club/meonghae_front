import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/dial_box_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/swich_widget.dart';
import 'package:meonghae_front/widgets/common/dial_Input_widget.dart';

class AdditionalInfoWidget extends StatefulWidget {
  final Map<String, dynamic> calendarData;
  final Function setCalendarData;
  final TextEditingController memoController;
  const AdditionalInfoWidget({
    super.key,
    required this.calendarData,
    required this.setCalendarData,
    required this.memoController,
  });

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  DateTime selectedDate = DateTime.now();

  List<String> alarmDay = [];

  @override
  void initState() {
    for (int i = 0; i < 30; i++) {
      alarmDay.add('${30 - i}일 전');
    }
    alarmDay.add('당일');
    for (int i = 0; i < 30; i++) {
      alarmDay.add('${i + 1}일 후');
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(
        '###${alarmDay[(30 - (DateTime.now().day - widget.calendarData['alarmTime'].day)).toInt()]}');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColor.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 75,
                  child: Text(
                    '일정일',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.black2,
                    ),
                  ),
                ),
                DialBoxWidget(
                  label: DateFormat('yyyy. MM. dd')
                      .format(widget.calendarData['scheduleTime']),
                  onSave: (DateTime dateTime) =>
                      widget.setCalendarData('scheduleTime', dateTime),
                  dialType: DialType.DATE,
                  scheduleTime: widget.calendarData['scheduleTime'],
                  textAlign: TextAlign.center,
                ),
                DialBoxWidget(
                  label: DateFormat('a hh:mm', 'ko')
                      .format(widget.calendarData['scheduleTime']),
                  onSave: (DateTime dateTime) =>
                      widget.setCalendarData('scheduleTime', dateTime),
                  dialType: DialType.TIME,
                  scheduleTime: widget.calendarData['scheduleTime'],
                  textAlign: TextAlign.end,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        AnimatedContainer(
          clipBehavior: Clip.hardEdge,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          height: widget.calendarData['isAlarm'] ? 91 : 45,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomColor.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '알림',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2,
                          ),
                        ),
                        SwitchWidget(
                          clickSwitch: () => widget.setCalendarData(
                              'isAlarm', !widget.calendarData['isAlarm']),
                          isChecked: widget.calendarData['isAlarm'],
                        ),
                      ],
                    ),
                  ),
                ),
                if (widget.calendarData['isAlarm'])
                  Column(
                    children: [
                      Container(height: 1, color: CustomColor.ivory2),
                      SizedBox(
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 75,
                                child: Text(
                                  '알림 설정',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: CustomColor.black2,
                                  ),
                                ),
                              ),
                              DialInputWidget(
                                width: 75,
                                height: 30,
                                itemHeight: 30,
                                list: alarmDay,
                                listHeight: 150,
                                fontSize: 13,
                                color: CustomColor.gray,
                                bgColor: CustomColor.white,
                                strColor: CustomColor.ivory2,
                                defaultValue: alarmDay[(30 -
                                        (DateTime.now().day -
                                            widget
                                                .calendarData['alarmTime'].day))
                                    .toInt()],
                                setValue: (int index) => widget.setCalendarData(
                                    'alarmTime',
                                    DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      (DateTime.now().day - (30 - index)),
                                      widget.calendarData['alarmTime'].hour,
                                      widget.calendarData['alarmTime'].minute,
                                    )),
                              ),
                              DialBoxWidget(
                                label: DateFormat('a hh:mm', 'ko')
                                    .format(widget.calendarData['alarmTime']),
                                onSave: (DateTime dateTime) => widget
                                    .setCalendarData('alarmTime', dateTime),
                                dialType: DialType.TIME,
                                scheduleTime: widget.calendarData['alarmTime'],
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 301,
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '메모',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black2,
                  ),
                ),
                TextField(
                  controller: widget.memoController,
                  style: const TextStyle(
                    color: CustomColor.black2,
                    fontSize: 13,
                  ),
                  maxLines: 20,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(top: 12),
                    hintText: "내용을 입력해주세요",
                    hintStyle: TextStyle(fontSize: 12, color: CustomColor.gray),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
