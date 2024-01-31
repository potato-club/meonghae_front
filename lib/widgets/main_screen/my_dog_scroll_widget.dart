import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/models/dog_info_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class MyDogScrollWidget extends StatefulWidget {
  const MyDogScrollWidget({super.key});

  @override
  State<MyDogScrollWidget> createState() => _MyDogScrollWidgetState();
}

class _MyDogScrollWidgetState extends State<MyDogScrollWidget> {
  Widget createDogCardItem(DogInfoModel dogInfo, bool isEnd) {
    return Padding(
      padding: EdgeInsets.only(right: isEnd ? 0 : 30),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 70,
            height: 70,
            decoration: const BoxDecoration(
                color: CustomColor.ivory2, shape: BoxShape.circle),
            child: dogInfo.s3ResponseDto != null
                ? CachedNetworkImage(
                    imageUrl: dogInfo.s3ResponseDto!['fileUrl'],
                    fit: BoxFit.cover,
                    memCacheWidth: 350,
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
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              dogInfo.petName,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Stack(children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: GetX<DogController>(builder: (controller) {
            return Row(
              children: [
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                if (controller.dogsInfo.isNotEmpty)
                  for (var i = 0; i < controller.dogsInfo.length; i++)
                    createDogCardItem(
                      controller.dogsInfo[i],
                      i + 1 == controller.dogsInfo.length,
                    ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.06),
              ],
            );
          }),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  CustomColor.white,
                  CustomColor.white.withOpacity(0),
                ])),
            height: 91,
            width: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                  CustomColor.white,
                  CustomColor.white.withOpacity(0),
                ])),
            height: 91,
            width: MediaQuery.of(context).size.width * 0.06,
          ),
        ),
      ]),
    );
  }
}
