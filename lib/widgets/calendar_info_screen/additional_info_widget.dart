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
  final repeatList = ['안함', '함'];
  String repeat = '안함';
  final alarmList = ['끄기', '켜기'];
  String alarm = '켜기';

  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CustomColor.lightGray1,
                      width: 1.0,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 9,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '시작',
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
                                          '${DateFormat('yyyyMMdd').format(selectedDate)}')));
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
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        // SizedBox(
        //   height: 45,
        //   child: Stack(children: [
        //     SelectInputWidget(
        //       width: MediaQuery.of(context).size.width * 0.88,
        //       height: 45,
        //       itemHeight: 45,
        //       list: repeatList,
        //       listHeight: 90,
        //       borderRadius: 10,
        //       fontSize: 13,
        //       defaultValue: repeat,
        //       setValue: (String value) => setState(() => repeat = value),
        //       isBigIcon: true,
        //       textAlign: TextAlign.right,
        //     ),
        //     const Positioned(
        //       top: 0,
        //       bottom: 0,
        //       left: 20,
        //       child: Center(
        //         child: Text(
        //           '반복',
        //           style: TextStyle(
        //             fontSize: 14,
        //             fontWeight: FontWeight.w700,
        //             color: CustomColor.black1,
        //           ),
        //         ),
        //       ),
        //     )
        //   ]),
        // ),
        // const SizedBox(
        //   height: 24,
        // ),
        SizedBox(
            height: 45,
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: CustomColor.lightGray1,
                width: 1.0,
              ))),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '하루종일',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black1,
                      ),
                    ),
                    SwitchWidget(
                      clickSwitch: widget.setCalendarData(
                          'isAlarm', widget.calendarData['isAlarm']),
                      isChecked: widget.calendarData['isAlarm'],
                    ),
                  ],
                ),
              ),
            )),
        const SizedBox(
          height: 24,
        ),
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
