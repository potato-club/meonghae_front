import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/custom_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/camera.dart';

class ImagesFormWidget extends StatefulWidget {
  const ImagesFormWidget({super.key});

  @override
  State<ImagesFormWidget> createState() => _ImagesFormWidgetState();
}

class _ImagesFormWidgetState extends State<ImagesFormWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<PostController>(builder: (controller) {
      var maxImageLength = controller.writeType.value == 3 ? 5 : 3;
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06),
          child: Row(
            children: [
              if (controller.images.length < maxImageLength)
                Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: InkWell(
                    onTap: () => controller.pickImage(),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: CustomColor.lightGray1, width: 1.0)),
                      width: 80,
                      height: 80,
                      child: const Center(child: CameraSVG()),
                    ),
                  ),
                ),
              for (int i = 0; i < controller.images.length; i++)
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: i != 0 ? 14 : 0),
                      child: InkWell(
                        onTap: () => CustomModalWidget.show("사진을 삭제하시겠어요?", () {
                          controller.deleteImage(i);
                          FocusScope.of(context).unfocus();
                        }),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Container(
                          width: 80,
                          height: 80,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.file(
                              Get.find<PostController>().images[i],
                              fit: BoxFit.cover),
                        ),
                      ),
                    )
                  ],
                )
            ],
          ),
        ),
      );
    });
  }
}
