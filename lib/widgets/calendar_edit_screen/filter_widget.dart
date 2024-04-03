import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_edit_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/data/filter_categories.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/select_input_widget.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarEditController>(builder: (controller) {
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
                      controller.category.value = value;
                      value == '직접입력'
                          ? controller.customMode.value = true
                          : controller.customMode.value = false;
                      controller.detailIndex.value = -1;
                      controller.editData.value.scheduleType = '';
                    },
                    defaultValue: controller.category.value, //수정
                  ),
                  if (controller.customMode.value)
                    SizedBox(
                      height: 45,
                      child: TextField(
                        controller: controller.titleController.value,
                        decoration: const InputDecoration(
                          hintText: "제목을 입력해주세요",
                          hintStyle:
                              TextStyle(fontSize: 12, color: CustomColor.gray),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        style: const TextStyle(
                            fontSize: 12, color: CustomColor.black2),
                        maxLines: 1,
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
                : categoryDetail[controller.category.value].length * 48.0,
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
                      index < categoryDetail[controller.category.value].length;
                      index++)
                    TextButton(
                      onPressed: () {
                        if (controller.detailIndex.value == index) {
                          controller.detailIndex.value = -1;
                          controller.editData.value.scheduleType = '';
                        } else {
                          controller.detailIndex.value = index;
                          controller.editData.value.scheduleType =
                              categoryDetail[controller.category.value]
                                  [controller.detailIndex.value]['value'];
                        }
                        setState(() {});
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
                                controller.detailIndex.value == index) {
                              return CustomColor.brown1;
                            }
                            return Colors.transparent;
                          },
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          categoryDetail[controller.category.value][index]
                                  ['type'] +
                              " " +
                              categoryDetail[controller.category.value][index]
                                  ['label'],
                          style: const TextStyle(
                            fontSize: 13,
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
