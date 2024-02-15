import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_edit_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class CycleCountWidget extends StatefulWidget {
  const CycleCountWidget({super.key});

  @override
  State<CycleCountWidget> createState() => _CycleCountWidgetState();
}

class _CycleCountWidgetState extends State<CycleCountWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarEditController>(builder: (controller) {
      return Row(
        children: [
          Container(
            width: 36,
            height: 30,
            decoration: BoxDecoration(
              color: CustomColor.white,
              border: Border.all(
                  color: controller.editData.value.cycleType == 'Month'
                      ? CustomColor.brown1
                      : CustomColor.ivory2,
                  width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: controller.cycleMonthController.value,
              onTap: () {
                controller.cycleDayController.value.clear();
                controller.editData.value.cycleType = 'Month';
              },
              onChanged: (value) {
                controller.editData.value.cycle = int.parse(value);
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
              style: const TextStyle(fontSize: 13, color: CustomColor.black2),
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 2),
          const Text(
            '달',
            style: TextStyle(fontSize: 13, color: CustomColor.gray),
          ),
          const SizedBox(width: 4),
          Container(
            width: 36,
            height: 30,
            decoration: BoxDecoration(
              color: CustomColor.white,
              border: Border.all(
                  color: controller.editData.value.cycleType == 'Day'
                      ? CustomColor.brown1
                      : CustomColor.ivory2,
                  width: 1),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: controller.cycleDayController.value,
              onTap: () {
                controller.cycleMonthController.value.clear();
                controller.editData.value.cycleType = 'Day';
              },
              onChanged: (value) {
                controller.editData.value.cycle = int.parse(value);
              },
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 0, vertical: 15)),
              style: const TextStyle(fontSize: 13, color: CustomColor.black2),
              maxLines: 1,
            ),
          ),
          const SizedBox(width: 2),
          const Text(
            '일 마다',
            style: TextStyle(fontSize: 13, color: CustomColor.gray),
          ),
        ],
      );
    });
  }
}
