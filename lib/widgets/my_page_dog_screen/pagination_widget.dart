import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class PaginationWidget extends StatefulWidget {
  const PaginationWidget({super.key});

  @override
  State<PaginationWidget> createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<DogController>(builder: (controller) {
      return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: controller.isEdit.value
              ? [
                  for (var i = 0; i < controller.dogsForm.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: controller.slideIndex.value == i
                              ? CustomColor.black2
                              : CustomColor.gray,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    )
                ]
              : [
                  for (var i = 0; i < controller.dogsInfo.length; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: controller.slideIndex.value == i
                              ? CustomColor.black2
                              : CustomColor.gray,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                ]);
    });
  }
}
