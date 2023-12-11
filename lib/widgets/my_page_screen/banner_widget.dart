import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/gear.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: CustomColor.white),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.06,
          top: 34,
          bottom: 34,
        ),
        child: GetX<UserController>(builder: (controller) {
          return Row(
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: CustomColor.ivory2),
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
              const SizedBox(width: 13),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "${controller.userInfo.value.nickname}님 안녕하세요!",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black2,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GearSVG(strokeColor: CustomColor.black2),
                      Padding(
                        padding: EdgeInsets.only(left: 4),
                        child: Text(
                          "업데이트 공지 2.0.10.2",
                          style: TextStyle(
                              fontSize: 12,
                              color: CustomColor.black2,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                )
              ]),
            ],
          );
        }),
      ),
    );
  }
}
