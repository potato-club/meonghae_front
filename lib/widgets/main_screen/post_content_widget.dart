import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/screens/post_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';

class PostContentWidget extends StatefulWidget {
  const PostContentWidget({super.key});

  @override
  State<PostContentWidget> createState() => _PostContentWidgetState();
}

class _PostContentWidgetState extends State<PostContentWidget> {
  List<dynamic>? preview = [];
  Map<String, dynamic>? showData;
  Map<String, dynamic>? funData;
  Map<String, dynamic>? missingData;

  @override
  void initState() {
    getPreview();
    super.initState();
  }

  Future<void> getPreview() async {
    SendAPI.get(
      context: context,
      url: "/community-service/boards/main",
      successFunc: (data) {
        for (int i = 0; i < data.length; i++) {
          if (data[i]['type'] == 'SHOW') {
            showData = data[i];
          } else if (data[i]['type'] == 'FUN') {
            funData = data[i];
          } else {
            missingData = data[i];
          }
        }
      },
      errorMsg: "게시글 미리보기 정보 호출에 실패하였습니다",
    );
  }

  Widget createPostItem(String postCategory, String? content, bool isEndItem) {
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
              content ?? '',
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
        const MainContentLabelWidget(
            label: "인기 게시글", routingScreen: PostScreen()),
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Column(
            children: [
              createPostItem('멍자랑', showData?['title'], false),
              createPostItem('웃긴멍', funData?['title'], false),
              createPostItem('실종신고', missingData?['title'], true)
            ],
          ),
        )
      ],
    );
  }
}
