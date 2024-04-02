import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/post_write_screen/category_form_widget.dart';
import 'package:meonghae_front/widgets/post_write_screen/images_form_widget.dart';

class WriteFormWidget extends StatefulWidget {
  const WriteFormWidget({super.key});

  @override
  State<WriteFormWidget> createState() => _WriteFormWidgetState();
}

class _WriteFormWidgetState extends State<WriteFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: CustomColor.white),
      child: GetX<PostController>(builder: (controller) {
        if (controller.writeType.value == 3) {
          controller.contentTextController.text =
              '이름: 멍멍이\n나이: 5살\n견종/묘종: 시고르자브종\n특징: 등에 흰 무늬가 있어요\n\n위의 정보들을 포함하여 입력해주세요';
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  color: CustomColor.lightGray1,
                  width: 1.0,
                ))),
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: TextField(
                  controller: controller.titleTextController,
                  decoration: const InputDecoration(
                    hintText: "제목",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: CustomColor.gray,
                      fontWeight: FontWeight.bold,
                    ),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      top: 20,
                    ),
                  ),
                  style: const TextStyle(
                    fontSize: 15,
                    color: CustomColor.black2,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
            ),
            const CategoryFormWidget(),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 320,
              child: TextField(
                controller: controller.contentTextController,
                decoration: InputDecoration(
                  hintText:
                      controller.writeType.value == 3 ? null : "내용을 입력해주세요",
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: CustomColor.gray,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: MediaQuery.of(context).size.width * 0.06,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 13,
                  color: CustomColor.black2,
                ),
                maxLines: null,
                textInputAction: TextInputAction.newline,
              ),
            ),
            const SizedBox(
              height: 104,
              child: Align(
                alignment: Alignment.topLeft,
                child: ImagesFormWidget(),
              ),
            )
          ],
        );
      }),
    );
  }
}
