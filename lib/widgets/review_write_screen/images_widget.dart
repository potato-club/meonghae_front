import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/custom_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/plus.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({super.key});

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<ReviewController>(builder: (controller) {
      return Row(
        children: [
          for (int i = 0; i < controller.images.length; i++)
            Row(
              children: [
                InkWell(
                  onTap: () => CustomModalWidget.show(
                    context,
                    "사진을 삭제하시겠어요?",
                    () => controller.deleteImage(i),
                  ),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Container(
                    width: 78,
                    height: 78,
                    clipBehavior: Clip.hardEdge,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: Image.file(controller.images[i], fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(width: 14)
              ],
            ),
          if (controller.images.length < 3)
            InkWell(
              onTap: () => controller.pickImage(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: SizedBox(
                width: 80,
                height: 80,
                child: DottedBorder(
                    color: CustomColor.gray,
                    strokeWidth: 1,
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: const Center(
                      child: PlusSVG(
                        color: CustomColor.gray,
                      ),
                    )),
              ),
            )
        ],
      );
    });
  }
}
