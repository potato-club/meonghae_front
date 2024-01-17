import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () => Get.offNamed(AppRoutes.main),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06,
              vertical: 8,
            ),
            child: const SizedBox(
                width: 24,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ArrowSVG(strokeColor: CustomColor.black2))),
          ),
        ),
        const Text(
          '채팅 문의',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: CustomColor.black2),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
            vertical: 20,
          ),
          child: const SizedBox(width: 24),
        ),
      ],
    );
  }
}
