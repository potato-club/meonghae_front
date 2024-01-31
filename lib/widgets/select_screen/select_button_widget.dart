import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class SelectButtonWidget extends StatelessWidget {
  final bool hasAnimal;
  final String content;

  const SelectButtonWidget(
      {super.key, required this.content, required this.hasAnimal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.find<UserController>().setHasAnimal(hasAnimal);
        Get.toNamed(AppRoutes.registerUser);
      },
      child: Container(
          width: 270,
          height: 48,
          decoration: BoxDecoration(
            color: CustomColor.brown1,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
    );
  }
}
