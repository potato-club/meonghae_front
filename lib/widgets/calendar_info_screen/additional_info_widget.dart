import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/swich_widget.dart';
import 'package:meonghae_front/widgets/common/select_input_widget.dart';

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

  final bool _isAlways = false;
  DateTime? _selectedStartDate;
  DateTime? _selectedFinishDate;

  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedFinishTime;

  Future<void> _selectStartTime(BuildContext context) async {
    print(_textEditingController.text);

    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedStartTime = pickedTime;
      });
    }
  }

  Future<void> _selectFinishTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      setState(() {
        _selectedFinishTime = pickedTime;
      });
    }
  }

  final TextEditingController _textEditingController = TextEditingController();

  void _selectStartDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedStartDate = pickedDate;
      });
    }
  }

  void _selectFinishDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedFinishDate = pickedDate;
      });
    }
  }

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
                          _selectStartDate(context);
                        },
                        child: Text(
                          _selectedStartDate != null
                              ? DateFormat('yyyy-MM-dd')
                                  .format(_selectedStartDate!)
                              : '0000-00-00',
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: CustomColor.gray,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _selectStartTime(context);
                        },
                        child: Text(
                          _selectedStartTime != null
                              ? _selectedStartTime!.format(context)
                              : '00:00 AM',
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
                        _selectFinishDate(context);
                      },
                      child: Text(
                        _selectedFinishDate != null
                            ? DateFormat('yyyy-MM-dd')
                                .format(_selectedFinishDate!)
                            : '0000-00-00',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: CustomColor.gray,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        _selectFinishTime(context);
                      },
                      child: Text(
                        _selectedFinishTime != null
                            ? _selectedFinishTime!.format(context)
                            : '00:00 AM',
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
