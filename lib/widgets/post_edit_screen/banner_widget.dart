import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_edit_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/save_check.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: const BoxDecoration(
        color: CustomColor.brown1,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () => Get.find<PostEditController>().willPop(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                      vertical: 20,
                    ),
                    child: const SizedBox(
                        width: 24,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: ArrowSVG(strokeColor: CustomColor.black2))),
                  )),
              const Text('게시물 작성',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.black2)),
              InkWell(
                  onTap: () => Get.find<PostEditController>().editData(),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: 20,
                      ),
                      child: const SaveCheckSVG()))
            ],
          ),
        ],
      ),
    );
  }
}
