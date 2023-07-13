import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/swich_widget.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:spinner_date_time_picker/spinner_date_time_picker.dart';

class AdditionalInfoWidget extends StatefulWidget {
  final Map<String, dynamic> calendarData;
  final Function setCalendarData;
  const AdditionalInfoWidget({
    super.key,
    required this.calendarData,
    required this.setCalendarData,
  });

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  DateTime selectedDate = DateTime.now();

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                const Text(
                  '일정일',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black1,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                            child: SpinnerDateTimePicker(
                                initialDateTime: DateTime.now(),
                                maximumDate: DateTime.now()
                                    .add(const Duration(days: 7500)),
                                minimumDate: DateTime.now()
                                    .subtract(const Duration(days: 7500)),
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                didSetTime: (value) => widget.setCalendarData(
                                    'scheduleTime',
                                    DateFormat('yyyyMMdd')
                                        .format(selectedDate))));
                      },
                    );
                  },
                  child: Text(
                    DateFormat('yyyy-MM-dd').format(selectedDate),
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: CustomColor.gray,
                    ),
                  ),
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
                            color: CustomColor.black1,
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
                      Container(height: 1, color: CustomColor.brown1),
                      SizedBox(
                        height: 45,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '알림 설정',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.black1,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                          child: SpinnerDateTimePicker(
                                              initialDateTime: DateTime.now(),
                                              maximumDate: DateTime.now().add(
                                                  const Duration(days: 7500)),
                                              minimumDate: DateTime.now()
                                                  .subtract(const Duration(
                                                      days: 7500)),
                                              mode:
                                                  CupertinoDatePickerMode.date,
                                              use24hFormat: true,
                                              didSetTime: (value) =>
                                                  widget.setCalendarData(
                                                      'scheduleTime',
                                                      DateFormat('yyyyMMdd')
                                                          .format(
                                                              selectedDate))));
                                    },
                                  );
                                },
                                child: Text(
                                  DateFormat('yyyy-MM-dd').format(selectedDate),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
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
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 376,
          decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 22, right: 22),
            child: TextField(
              controller: _textEditingController,
              style: const TextStyle(
                color: CustomColor.black1,
                fontWeight: FontWeight.w700,
                fontSize: 14,
              ),
              maxLines: null,
              decoration: const InputDecoration(
                labelText: '메모',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
