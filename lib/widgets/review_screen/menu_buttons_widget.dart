import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class MenuButtonsWidget extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final Widget widget3;
  final int id1;
  final int id2;
  final int id3;
  const MenuButtonsWidget({
    super.key,
    required this.widget1,
    required this.widget2,
    required this.widget3,
    required this.id1,
    required this.id2,
    required this.id3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025,
          vertical: MediaQuery.of(context).size.height * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Get.find<ReviewController>().setType(id1);
              Get.toNamed(AppRoutes.review);
            },
            child: Column(
              children: [
                widget1,
                const SizedBox(height: 4),
                Text(
                  Get.find<ReviewController>().typeToString(id1),
                  style:
                      const TextStyle(color: CustomColor.black4, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 62,
            decoration: const BoxDecoration(color: CustomColor.lightGray1),
          ),
          GestureDetector(
            onTap: () {
              Get.find<ReviewController>().setType(id2);
              Get.toNamed(AppRoutes.review);
            },
            child: Column(
              children: [
                widget2,
                const SizedBox(height: 4),
                Text(
                  Get.find<ReviewController>().typeToString(id2),
                  style:
                      const TextStyle(color: CustomColor.black4, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 62,
            decoration: const BoxDecoration(color: CustomColor.lightGray1),
          ),
          GestureDetector(
            onTap: () {
              Get.find<ReviewController>().setType(id3);
              Get.toNamed(AppRoutes.review);
            },
            child: Column(
              children: [
                widget3,
                const SizedBox(height: 4),
                Text(
                  Get.find<ReviewController>().typeToString(id3),
                  style:
                      const TextStyle(color: CustomColor.black4, fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
