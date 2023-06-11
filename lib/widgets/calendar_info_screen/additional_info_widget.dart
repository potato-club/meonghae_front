import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/swich_widget.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';
import 'package:spinner_date_time_picker/spinner_date_time_picker.dart';

class AdditionalInfoWidget extends StatefulWidget {
  const AdditionalInfoWidget({super.key});

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  bool isAllday = false;
  List<String> repeatList = ['안 함', '함'];
  String selectedRepeatList = '안 함';

  List<String> informList = ['안 함', '함'];
  String selectedInformList = '안 함';

  DateTime selectedStartDate = DateTime.now();
  DateTime selectedStartTime = DateTime.now();
  DateTime selectedFinishDate = DateTime.now();
  DateTime selectedFinishTime = DateTime.now();

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
                height: 45,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: CustomColor.lightGray1,
                      width: 1.0,
                    ),
                  ),
                ),
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
                        clickSwitch: () {
                          setState(() {
                            isAllday = !isAllday;
                          });
                        },
                        isChecked: isAllday,
                      ),
                    ],
                  ),
                ),
              ),
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
                              var today = DateTime.now();
                              return Dialog(
                                child: SpinnerDateTimePicker(
                                  initialDateTime: today,
                                  maximumDate:
                                      today.add(const Duration(days: 7500)),
                                  minimumDate: today
                                      .subtract(const Duration(days: 7500)),
                                  mode: CupertinoDatePickerMode.date,
                                  use24hFormat: true,
                                  didSetTime: (value) {
                                    setState(() {
                                      selectedStartDate = value;
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          DateFormat('yyyy-MM-dd').format(selectedStartDate),
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: CustomColor.gray,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              var today = DateTime.now();
                              return Dialog(
                                child: SpinnerDateTimePicker(
                                  initialDateTime: today,
                                  maximumDate:
                                      today.add(const Duration(days: 7)),
                                  minimumDate:
                                      today.subtract(const Duration(days: 1)),
                                  mode: CupertinoDatePickerMode.time,
                                  use24hFormat: true,
                                  didSetTime: (value) {
                                    setState(() {
                                      selectedStartTime = value;
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          DateFormat('HH:mm').format(selectedStartTime),
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 9,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '종료',
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
                            var today = DateTime.now();
                            return Dialog(
                              child: SpinnerDateTimePicker(
                                initialDateTime: today,
                                maximumDate:
                                    today.add(const Duration(days: 7500)),
                                minimumDate:
                                    today.subtract(const Duration(days: 7500)),
                                mode: CupertinoDatePickerMode.date,
                                use24hFormat: true,
                                didSetTime: (value) {
                                  setState(() {
                                    selectedFinishDate = value;
                                  });
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        DateFormat('yyyy-MM-dd').format(selectedFinishDate),
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: CustomColor.gray,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            var today = DateTime.now();
                            return Dialog(
                              child: SpinnerDateTimePicker(
                                initialDateTime: today,
                                maximumDate: today.add(const Duration(days: 7)),
                                minimumDate:
                                    today.subtract(const Duration(days: 1)),
                                mode: CupertinoDatePickerMode.time,
                                use24hFormat: true,
                                didSetTime: (value) {
                                  setState(() {
                                    selectedFinishTime = value;
                                  });
                                },
                              ),
                            );
                          },
                        );
                      },
                      child: Text(
                        DateFormat('HH:mm').format(selectedFinishTime),
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
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 45,
          child: Stack(children: [
            SelectInputWidget(
              width: MediaQuery.of(context).size.width * 0.88,
              height: 45,
              itemHeight: 45,
              list: repeatList,
              listHeight: 90,
              borderRadius: 10,
              fontSize: 13,
              defaultValue: selectedRepeatList,
              setValue: (String value) =>
                  setState(() => selectedRepeatList = value),
              isBigIcon: true,
              textAlign: TextAlign.right,
            ),
            const Positioned(
              top: 0,
              bottom: 0,
              left: 20,
              child: Center(
                child: Text(
                  '반복',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black1,
                  ),
                ),
              ),
            )
          ]),
        ),
        const SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 45,
          child: Stack(children: [
            SelectInputWidget(
              width: MediaQuery.of(context).size.width * 0.88,
              height: 45,
              itemHeight: 45,
              list: informList,
              listHeight: 90,
              borderRadius: 10,
              fontSize: 13,
              defaultValue: selectedInformList,
              setValue: (String value) =>
                  setState(() => selectedInformList = value),
              isBigIcon: true,
              textAlign: TextAlign.right,
            ),
            const Positioned(
              top: 0,
              bottom: 0,
              left: 20,
              child: Center(
                child: Text(
                  '알림',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black1,
                  ),
                ),
              ),
            )
          ]),
        ),
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
