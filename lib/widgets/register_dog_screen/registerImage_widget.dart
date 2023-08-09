import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/big_plus.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class RegisterImage extends StatefulWidget {
  const RegisterImage({super.key});

  @override
  _RegisterImageState createState() => _RegisterImageState();
}

class _RegisterImageState extends State<RegisterImage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 130,
          height: 130,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: GetX<DogController>(builder: (controller) {
                return Container(
                    color: CustomColor.white.withOpacity(0.5),
                    child: controller
                                .dogsInfo[controller.slideIndex.value].image !=
                            null
                        ? CircleAvatar(
                            backgroundImage: FileImage(controller
                                .dogsInfo[controller.slideIndex.value].image!),
                            radius: 75,
                          )
                        : const Center(
                            child: SizedBox(
                                width: 31, height: 31, child: BigPlusSVG())));
              }),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            width: 34,
            height: 34,
            child: FloatingActionButton(
                elevation: 0,
                backgroundColor: CustomColor.white.withOpacity(0.8),
                onPressed: () => Get.find<DogController>().pickImage(),
                child: const PencilSVG(color: CustomColor.gray)),
          ),
        ),
      ],
    );
  }
}
