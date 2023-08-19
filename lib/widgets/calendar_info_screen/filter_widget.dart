import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/category_dummy.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/select_input_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  int detailIndex = -1;
  String category = categoryKey[1];

  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(builder: (controller) {
      print(controller.calendarForm.value.scheduleType);
      return Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            height: controller.customMode.value ? 90 : 45,
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
                        value == '직접입력'
                            ? controller.customMode.value = true
                            : controller.customMode.value = false;
                        detailIndex = -1;
                      });
                      controller.calendarForm.value.scheduleType = null;
                    },
                    defaultValue: category,
                  ),
                  if (controller.customMode.value)
                    SizedBox(
                      height: 45,
                      child: TextField(
                        decoration: const InputDecoration(
                          hintText: "제목을 입력해주세요",
                          hintStyle:
                              TextStyle(fontSize: 13, color: CustomColor.gray),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        style: const TextStyle(
                            fontSize: 13, color: CustomColor.black2),
                        maxLines: 1,
                        onChanged: (value) {
                          controller.calendarForm.value.scheduleType = value;
                          controller.calendarForm.update((val) {});
                        },
                      ),
                    )
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedContainer(
            height: controller.customMode.value
                ? 0
                : categoryDetail[category].length * 48.0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: CustomColor.white,
              borderRadius: BorderRadius.circular(10),
            ),
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
                            controller.calendarForm.value.scheduleType = null;
                          } else {
                            detailIndex = index;
                            controller.calendarForm.value.scheduleType =
                                categoryDetail[category][detailIndex]['value'];
                            controller.calendarForm.update((val) {});
                          }
                        });
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(0))),
                        minimumSize: MaterialStateProperty.all<Size>(
                            const Size(double.infinity, 48)),
                        padding: const MaterialStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 22)),
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                          (states) {
                            if (states.contains(MaterialState.pressed) ||
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
                          categoryDetail[category][index]['label'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (!controller.customMode.value) const SizedBox(height: 24),
        ],
      );
    });
  }
}
