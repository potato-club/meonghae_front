import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/gear.dart';
import 'package:meonghae_front/widgets/svg/tiny_bottom_arrow.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(
          color: CustomColor.brown1,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: GetX<UserController>(builder: (controller) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(AppRoutes.mypageUser),
                  child: Container(
                    width: 54,
                    height: 54,
                    decoration: const BoxDecoration(
                        color: CustomColor.white, shape: BoxShape.circle),
                    clipBehavior: Clip.hardEdge,
                    child: controller.userInfo.value.fileUrl != null
                        ? CachedNetworkImage(
                            imageUrl: controller.userInfo.value.fileUrl!,
                            fit: BoxFit.cover,
                            memCacheWidth: 270,
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
                Padding(
                  padding: const EdgeInsets.only(left: 13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.userInfo.value.nickname}님 안녕하세요!",
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 6),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GearSVG(strokeColor: CustomColor.white),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                "업데이트 공지 2.0.10.2",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: CustomColor.white,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
      const Positioned(
        right: 0,
        top: -60,
        child: Image(
            image: AssetImage('assets/images/dog_pictures/bone_dog.png'),
            width: 116),
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () => Get.toNamed(AppRoutes.mypage),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              const Text(
                'MY',
                style: TextStyle(fontSize: 11, color: CustomColor.black2),
              ),
              Transform.rotate(
                  angle: -1.58,
                  child:
                      const TinyBottomArrowSVG(strokeColor: CustomColor.black2))
            ]),
          ),
        ),
      )
    ]);
  }
}
