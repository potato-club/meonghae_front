import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class PostMenuBarWidget extends StatelessWidget {
  const PostMenuBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GetX<PostController>(builder: (controller) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => controller.setType(1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Column(
                children: [
                  Text(
                    '멍자랑',
                    style: TextStyle(
                        fontSize: 16,
                        color: controller.type.value == 1
                            ? CustomColor.brown1
                            : CustomColor.lightGray2,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Container(
                      decoration: BoxDecoration(
                          color: controller.type.value == 1
                              ? CustomColor.brown1
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(1)),
                      width: 30,
                      height: 2)
                ],
              ),
            ),
          );
        }),
        GetX<PostController>(builder: (controller) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => controller.setType(2),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Column(
                children: [
                  Text(
                    '웃긴멍',
                    style: TextStyle(
                        fontSize: 16,
                        color: controller.type.value == 2
                            ? CustomColor.brown1
                            : CustomColor.lightGray2,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Container(
                      decoration: BoxDecoration(
                          color: controller.type.value == 2
                              ? CustomColor.brown1
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(1)),
                      width: 30,
                      height: 2)
                ],
              ),
            ),
          );
        }),
        GetX<PostController>(builder: (controller) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () => controller.setType(3),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              child: Column(
                children: [
                  Text(
                    '실종신고',
                    style: TextStyle(
                        fontSize: 16,
                        color: controller.type.value == 3
                            ? CustomColor.brown1
                            : CustomColor.lightGray2,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 6),
                  Container(
                      decoration: BoxDecoration(
                          color: controller.type.value == 3
                              ? CustomColor.brown1
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(1)),
                      width: 30,
                      height: 2)
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
