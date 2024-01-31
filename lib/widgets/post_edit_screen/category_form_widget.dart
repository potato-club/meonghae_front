import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class CategoryFormWidget extends StatefulWidget {
  const CategoryFormWidget({super.key});

  @override
  State<CategoryFormWidget> createState() => _CategoryFormWidgetState();
}

class _CategoryFormWidgetState extends State<CategoryFormWidget> {
  Widget categoryButton(bool selected, String label) {
    return Container(
        width: selected ? 80 : 64,
        height: selected ? 30 : 24,
        decoration: BoxDecoration(
            color: selected ? CustomColor.brown1 : CustomColor.lightGray3,
            borderRadius: BorderRadius.circular(5)),
        child: Center(
            child: Text(label,
                style: TextStyle(
                  fontSize: selected ? 14 : 11,
                  color: selected ? CustomColor.black2 : CustomColor.black4,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20, left: MediaQuery.of(context).size.width * 0.06, bottom: 6),
      child: SizedBox(
        height: 30,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            categoryButton(Get.find<PostController>().type.value == 1, '멍자랑'),
            const SizedBox(width: 16),
            categoryButton(Get.find<PostController>().type.value == 2, '웃긴멍'),
            const SizedBox(width: 16),
            categoryButton(Get.find<PostController>().type.value == 3, '실종신고'),
          ],
        ),
      ),
    );
  }
}
