import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';

class ShowUserInfoWidget extends StatefulWidget {
  const ShowUserInfoWidget({super.key});

  @override
  State<ShowUserInfoWidget> createState() => _ShowUserInfoWidgetState();
}

class _ShowUserInfoWidgetState extends State<ShowUserInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06),
      child: GetX<UserController>(builder: (controller) {
        return Column(
          children: [
            Container(
              width: 130,
              height: 130,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: CustomColor.white),
              clipBehavior: Clip.hardEdge,
              child: controller.prevUserInfo.value.fileUrl != null
                  ? CachedNetworkImage(
                      imageUrl: controller.prevUserInfo.value.fileUrl!,
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
            const SizedBox(height: 60),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 8),
                  child: Text('이름',
                      style:
                          TextStyle(fontSize: 14, color: CustomColor.black2)),
                ),
                Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.prevUserInfo.value.nickname,
                        style: const TextStyle(
                          fontSize: 14,
                          color: CustomColor.black2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 8, top: 14),
                  child: Text('생일',
                      style:
                          TextStyle(fontSize: 14, color: CustomColor.black2)),
                ),
                Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        controller.prevUserInfo.value.birth
                            .replaceAll('-', '.'),
                        style: const TextStyle(
                          fontSize: 14,
                          color: CustomColor.black2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 8, top: 14),
                  child: Text('나이',
                      style:
                          TextStyle(fontSize: 14, color: CustomColor.black2)),
                ),
                Container(
                  height: 44,
                  width: MediaQuery.of(context).size.width * 0.88,
                  decoration: BoxDecoration(
                      color: CustomColor.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${controller.prevUserInfo.value.age}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: CustomColor.black2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      }),
    );
  }
}
