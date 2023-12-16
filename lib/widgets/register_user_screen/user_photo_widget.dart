import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class UserPhotoWidget extends StatefulWidget {
  const UserPhotoWidget({super.key});

  @override
  State<UserPhotoWidget> createState() => _UserPhotoWidgetState();
}

class _UserPhotoWidgetState extends State<UserPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: GetX<UserController>(builder: (controller) {
          return Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: MediaQuery.of(context).size.width * 0.35,
            decoration: const BoxDecoration(
                color: CustomColor.white, shape: BoxShape.circle),
            child: controller.file.value != null
                ? CircleAvatar(
                    backgroundImage: FileImage(controller.file.value!),
                    radius: 75,
                  )
                : Transform.scale(
                    scale: 1.8,
                    child: const Image(
                      image: AssetImage(
                        'assets/images/dog_pictures/face.png',
                      ),
                    ),
                  ),
          );
        }),
      ),
      Positioned(
        left: MediaQuery.of(context).size.width * 0.5 + 30,
        bottom: 0,
        child: SizedBox(
          width: 34,
          height: 34,
          child: FloatingActionButton(
              elevation: 0,
              backgroundColor: CustomColor.white.withOpacity(0.8),
              onPressed: () => Get.find<UserController>().pickImage(),
              child: const PencilSVG(color: CustomColor.gray)),
        ),
      )
    ]);
  }
}
