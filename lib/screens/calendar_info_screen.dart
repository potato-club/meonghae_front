import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:intl/intl.dart';

class CalenderInfoScreen extends StatefulWidget {
  const CalenderInfoScreen({super.key});

  @override
  State<CalenderInfoScreen> createState() => _CalenderInfoScreenState();
}

class _CalenderInfoScreenState extends State<CalenderInfoScreen> {
  List<String> textButtonData = [
    '종합백신',
    '코로나 장염',
    '켄넬코프',
    '인플루엔자',
    '광견병 ',
    '항체가검사',
    '심장사상충',
    '외부기생충',
  ];
  int selectedIndex = -1;

  List<String> dropdownList = ['예방접종', '구충제 바르기', '건강검진', '기타'];
  String selectedDropdown = '예방접종';

  List<String> repeatList = ['안함', '1번', '2번'];
  String selectedRepeatList = '안함';

  List<String> informList = ['안함', '1번', '2번'];
  String selectedInformList = '안함';

  bool _isAlways = false;
  DateTime? _selectedStartDate;
  DateTime? _selectedFinishDate;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivoey2,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: CustomColor.ivoey2,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: CustomColor.black1,
          onPressed: () {},
        ),
        title: const Text(
          '새로운 기록',
          style: TextStyle(
            color: CustomColor.black1,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            child: const Text(
              '저장',
              style: TextStyle(
                  color: CustomColor.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 33,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 6,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 22),
                          child: Text(
                            selectedDropdown,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: DropdownButton(
                          value: selectedDropdown,
                          underline: Container(),
                          items: dropdownList.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.gray,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (dynamic value) {
                            setState(() {
                              selectedDropdown = value;
                            });
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 22),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (int index = 0;
                              index < textButtonData.length;
                              index++)
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  if (selectedIndex == index) {
                                    selectedIndex = -1;
                                  } else {
                                    selectedIndex = index;
                                  }
                                });
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                  (states) {
                                    if (states
                                            .contains(MaterialState.pressed) ||
                                        selectedIndex == index) {
                                      return Colors.red;
                                    }
                                    return CustomColor.black1;
                                  },
                                ),
                              ),
                              child: Text(
                                textButtonData[index],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
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
                color: CustomColor.white,
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
              const SizedBox(
                height: 150,
              )
            ],
          ),
        ),
      ),
    );
  }
}
