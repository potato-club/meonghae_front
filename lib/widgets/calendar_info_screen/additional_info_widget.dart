import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/themes/customColor.dart';

class AdditionalInfoWidget extends StatefulWidget {
  const AdditionalInfoWidget({super.key});

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  List<String> repeatList = ['안함', '1번', '2번'];
  String selectedRepeatList = '안함';

  List<String> informList = ['안함', '1번', '2번'];
  String selectedInformList = '안함';

  bool _isAlways = false;
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
                    left: 19,
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
                      Transform.scale(
                        scale: 0.7,
                        child: Switch(
                          value: _isAlways,
                          onChanged: (bool newValue) {
                            setState(() {
                              _isAlways = newValue;
                            });
                          },
                        ),
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
                    left: 19,
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
                  left: 19,
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
        Container(
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 19,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '반복',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black1,
                  ),
                ),
                DropdownButton(
                  value: selectedRepeatList,
                  items: repeatList.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  underline: Container(),
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedRepeatList = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        Container(
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 19,
            ),
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
                DropdownButton(
                  value: selectedInformList,
                  items: informList.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  underline: Container(),
                  onChanged: (dynamic value) {
                    setState(() {
                      selectedInformList = value;
                    });
                  },
                ),
              ],
            ),
          ),
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
