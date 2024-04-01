import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_edit_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/trash.dart';

class EditButtonsWidget extends StatelessWidget {
  const EditButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.find<CalendarEditController>().deleteCalendarData(),
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: CustomColor.gray,
                borderRadius: BorderRadius.circular(10)),
            child: const Padding(
              padding: EdgeInsets.all(18),
              child: TrashSVG(strokeColor: CustomColor.white),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.06),
        GestureDetector(
          onTap: () => Get.find<CalendarEditController>().editCalendarData(),
          child: Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.82 - 60,
            decoration: BoxDecoration(
                color: CustomColor.brown1,
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text(
              '수정하기',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }
}
