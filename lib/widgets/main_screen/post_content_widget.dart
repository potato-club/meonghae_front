import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';

class PostContentWidget extends StatelessWidget {
  const PostContentWidget({super.key});

  Widget createPostItem(String postCategory, String content, bool isEndItem) {
    return Container(
      decoration: BoxDecoration(
        border: isEndItem
            ? null
            : const Border(
                bottom: BorderSide(
                  color: CustomColor.lightGray1,
                  width: 1,
                ),
              ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 6, bottom: isEndItem ? 0 : 8),
        child: Row(
          children: [
            SizedBox(
              width: 100,
              child: Text(
                postCategory,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const MainContentLabelWidget(label: "인기 게시글"),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              createPostItem('멍자랑', '울 멍멍님 모델이 됐어요!', false),
              createPostItem('웃긴멍', '외출한 사이에...', false),
              createPostItem('실종신고', '서울역 근처에서 강아지를 잃어...', true),
            ],
          ),
        )
      ],
    );
  }
}
