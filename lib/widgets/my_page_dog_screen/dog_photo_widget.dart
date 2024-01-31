import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class DogPhotoWidget extends StatefulWidget {
  final int index;
  const DogPhotoWidget({
    super.key,
    required this.index,
  });

  @override
  State<DogPhotoWidget> createState() => _DogPhotoWidgetState();
}

class _DogPhotoWidgetState extends State<DogPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<DogController>(builder: (controller) {
      return Stack(children: [
        Center(
          child: Container(
            width: 130,
            height: 130,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                color: CustomColor.ivory2, shape: BoxShape.circle),
            child: controller.dogsForm[widget.index].image != null
                ? CircleAvatar(
                    backgroundImage:
                        FileImage(controller.dogsForm[widget.index].image!),
                    radius: 75,
                  )
                : controller.dogsForm[widget.index].s3ResponseDto != null
                    ? CachedNetworkImage(
                        imageUrl: controller
                            .dogsForm[widget.index].s3ResponseDto!['fileUrl'],
                        fit: BoxFit.cover,
                        memCacheWidth: 650,
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
          ),
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
                onPressed: () => controller.pickImage(widget.index),
                child: const PencilSVG(color: CustomColor.gray)),
          ),
        )
      ]);
    });
  }
}
