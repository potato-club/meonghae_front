import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/search.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: CustomColor.ivory2, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            GestureDetector(
                onTap: () => {
                      if (textController.text.length > 1)
                        Get.find<ReviewController>()
                            .setKeyWord(textController.text)
                      else
                        SnackBarWidget.show(
                            SnackBarType.error, "2글자 이상의 단어를 검색해주세요")
                    },
                child: const SearchSVG(strokeColor: CustomColor.black2)),
            Expanded(
              child: Transform.translate(
                offset: const Offset(0, 2),
                child: TextFormField(
                  controller: textController,
                  decoration: const InputDecoration(
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14),
                    errorStyle:
                        TextStyle(fontSize: 11, color: Colors.transparent),
                  ),
                  textAlignVertical: TextAlignVertical.center,
                  style:
                      const TextStyle(fontSize: 14, color: CustomColor.black2),
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    return null;
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      Get.find<ReviewController>().setKeyWord('');
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
