import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/more.dart';

class BannerWidget extends StatefulWidget {
  final Function setIsPostMoreModal;
  const BannerWidget({
    super.key,
    required this.setIsPostMoreModal,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
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
                  onTap: () => Get.back(),
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
              GetX<PostController>(builder: (controller) {
                return Text(controller.typeToString(),
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2));
              }),
              GetX<PostDetailController>(builder: (controller) {
                return SizedBox(
                  width: 67,
                  child: controller.post.value.writer
                      ? InkWell(
                          onTap: () => widget.setIsPostMoreModal(true),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.06,
                              vertical: 20,
                            ),
                            child: const SizedBox(
                                width: 24,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: MoreSVG())),
                          ))
                      : null,
                );
              })
            ],
          ),
        ],
      ),
    );
  }
}
