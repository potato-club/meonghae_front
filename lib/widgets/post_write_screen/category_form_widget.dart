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
  Widget categoryButton(bool selected, String label, Function onTap) {
    return InkWell(
      onTap: () => onTap(),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: AnimatedContainer(
          width: selected ? 80 : 64,
          height: selected ? 30 : 24,
          decoration: BoxDecoration(
              color: selected ? CustomColor.brown1 : CustomColor.lightGray3,
              borderRadius: BorderRadius.circular(5)),
          duration: const Duration(milliseconds: 250),
          curve: Curves.ease,
          child: Center(
              child: Text(label,
                  style: TextStyle(
                    fontSize: selected ? 14 : 11,
                    color: selected ? CustomColor.black2 : CustomColor.black4,
                  )))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20, left: MediaQuery.of(context).size.width * 0.06, bottom: 6),
      child: SizedBox(
        height: 30,
        child: GetX<PostController>(builder: (controllter) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              categoryButton(
                controllter.writeType.value == 1,
                '멍자랑',
                () {
                  if (controllter.writeType.value == 3) {
                    controllter.contentTextController.clear();
                  }
                  controllter.setWriteType(1);
                  controllter.editImages();
                },
              ),
              const SizedBox(width: 16),
              categoryButton(
                controllter.writeType.value == 2,
                '웃긴멍',
                () {
                  if (controllter.writeType.value == 3) {
                    controllter.contentTextController.clear();
                  }
                  controllter.setWriteType(2);
                  controllter.editImages();
                },
              ),
              const SizedBox(width: 16),
              categoryButton(
                controllter.writeType.value == 3,
                '실종신고',
                () => controllter.setWriteType(3),
              ),
            ],
          );
        }),
      ),
    );
  }
}
