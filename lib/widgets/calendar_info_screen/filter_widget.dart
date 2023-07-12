import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/category_dummy.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/select_input_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/swich_widget.dart';

class FilterWidget extends StatefulWidget {
  final Function setCalendarData;
  final Map<String, dynamic> calendarData;
  const FilterWidget(
      {super.key, required this.setCalendarData, required this.calendarData});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  TextEditingController textController = TextEditingController();
  int detailIndex = -1;
  String category = categoryKey[1];

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          height: category == '직접입력' ? 90 : 45,
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SelectInputWidget(
                  list: categoryKey,
                  setValue: (String value) {
                    setState(() {
                      category = value;
                      detailIndex = -1;
                    });
                    textController.clear();
                  },
                  defaultValue: category,
                ),
                if (category == '직접입력')
                  SizedBox(
                    height: 45,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "제목을 입력해주세요",
                        hintStyle: const TextStyle(
                            fontSize: 13, color: CustomColor.gray),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                      ),
                      style: const TextStyle(
                          fontSize: 13, color: CustomColor.black2),
                      maxLines: 1,
                    ),
                  )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        AnimatedContainer(
          height: category == '직접입력'
              ? widget.calendarData['isRepeat']
                  ? 91
                  : 45
              : categoryDetail[category].length * 48.0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: category == '직접입력'
              ? SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            SwitchWidget(
                              clickSwitch: () => widget.setCalendarData(
                                  'isRepeat', !widget.calendarData['isRepeat']),
                              isChecked: widget.calendarData['isRepeat'],
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (widget.calendarData['isRepeat'])
                      Column(
                        children: [
                          Container(height: 1, color: CustomColor.brown3),
                          SizedBox(
                            height: 45,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                right: 9,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      '반복 설정',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: CustomColor.black1,
                                      ),
                                    ),
                                  ]),
                            ),
                          )
                        ],
                      ),
                  ]),
                )
              : Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for (int index = 0;
                                index < categoryDetail[category].length;
                                index++)
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    if (detailIndex == index) {
                                      detailIndex = -1;
                                      widget.setCalendarData(
                                          'vaccinationType', null);
                                    } else {
                                      detailIndex = index;
                                      widget.setCalendarData(
                                          'vaccinationType',
                                          categoryDetail[category]
                                              [detailIndex]);
                                    }
                                  });
                                },
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(0))),
                                  minimumSize: MaterialStateProperty.all<Size>(
                                      const Size(double.infinity, 48)),
                                  padding: const MaterialStatePropertyAll<
                                          EdgeInsets>(
                                      EdgeInsets.symmetric(horizontal: 22)),
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (states) {
                                      if (states.contains(
                                              MaterialState.pressed) ||
                                          detailIndex == index) {
                                        return CustomColor.brown1;
                                      }
                                      return Colors.transparent;
                                    },
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    categoryDetail[category][index][0],
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: CustomColor.black1,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
        )
      ],
    );
  }
}
