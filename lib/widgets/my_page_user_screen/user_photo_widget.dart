import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class UserPhotoWidget extends StatefulWidget {
  const UserPhotoWidget({super.key});

  @override
  State<UserPhotoWidget> createState() => _UserPhotoWidgetState();
}

class _UserPhotoWidgetState extends State<UserPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: Stack(children: [
        Center(
          child: GetX<UserController>(builder: (controller) {
            return Container(
              width: 130,
              height: 130,
              clipBehavior: Clip.hardEdge,
              decoration: const BoxDecoration(
                  color: CustomColor.white, shape: BoxShape.circle),
              child: controller.file.value != null
                  ? CircleAvatar(
                      backgroundImage: FileImage(controller.file.value!),
                      radius: 75,
                    )
                  : controller.userInfo.value.fileUrl != null
                      ? CachedNetworkImage(
                          imageUrl: controller.userInfo.value.fileUrl!,
                          fit: BoxFit.cover,
                          memCacheWidth: 375,
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error_outline_outlined,
                            color: CustomColor.brown1,
                          ),
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
          right: 0,
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
      ]),
    );
  }
}
