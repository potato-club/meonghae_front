import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class EditButtonWidget extends StatefulWidget {
  final CarouselController carouselController;
  const EditButtonWidget({super.key, required this.carouselController});

  @override
  State<EditButtonWidget> createState() => _EditButtonWidgetState();
}

class _EditButtonWidgetState extends State<EditButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: GetX<DogController>(builder: (controller) {
      return ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            fixedSize: const Size(288, 49),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            backgroundColor: CustomColor.black2,
          ),
          onPressed: () {
            if (controller.isEdit.value) {
              controller.editForm();
              if (controller.isError.value) {
                widget.carouselController.animateToPage(
                    controller.slideIndex.value,
                    duration: const Duration(milliseconds: 1000),
                    curve: Curves.ease);
                controller.isError.value = false;
              }
            } else {
              controller.setIsEdit(true);
              if (controller.dogsInfo.isEmpty) {
                controller.addDogForm();
              }
            }
          },
          child: Text(
            controller.isEdit.value
                ? '저장하기'
                : controller.dogsInfo.isEmpty
                    ? '추가하기'
                    : '수정하기',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ));
    }));
  }
}
