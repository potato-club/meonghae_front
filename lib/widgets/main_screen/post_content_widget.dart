import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';
import 'package:meonghae_front/widgets/svg/comment.dart';
import 'package:meonghae_front/widgets/svg/tiny_heart.dart';

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
      url: "/community-service/boards/main",
      successFunc: (data) {
        for (int i = 0; i < data.data.length; i++) {
          if (data.data[i]['type'] == 'SHOW') {
            showData = data.data[i];
          } else if (data.data[i]['type'] == 'FUN') {
            funData = data.data[i];
          } else {
            missingData = data.data[i];
          }
        }
        setState(() {});
      },
      errorMsg: "게시글 미리보기 정보 호출에 실패하였어요",
    );
  }

  Widget createPostItem(
      {required String postCategory,
      required String? content,
      required int? likes,
      required int? comments,
      required bool isEndItem}) {
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 72,
                  child: Text(
                    postCategory,
                    style: const TextStyle(fontSize: 13),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 1),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.88 - 130,
                    child: Text(
                      content ?? "아직 인기 게시글이 없어요",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          color: content != null
                              ? CustomColor.black1
                              : CustomColor.lightGray2),
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: Offset(0, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      if (likes != null)
                        const SizedBox(
                            width: 9, height: 9, child: TinyHeartSVG()),
                      const SizedBox(width: 2),
                      Text("${likes ?? ''}",
                          style: const TextStyle(
                              fontSize: 12, color: CustomColor.gray)),
                    ],
                  ),
                  const SizedBox(width: 6),
                  if (comments != null)
                    const SizedBox(width: 9, height: 9, child: CommentSVG()),
                  const SizedBox(width: 2),
                  Text("${comments ?? ''}",
                      style: const TextStyle(
                          fontSize: 12, color: CustomColor.gray)),
                ],
              ),
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
            label: "인기 게시글", routingPath: AppRoutes.post),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(
            children: [
              createPostItem(
                  postCategory: '멍자랑',
                  content: showData?['title'],
                  isEndItem: false,
                  likes: showData?['likes'],
                  comments: showData?['commentSize']),
              createPostItem(
                  postCategory: '웃긴멍',
                  content: funData?['title'],
                  isEndItem: false,
                  likes: funData?['likes'],
                  comments: funData?['commentSize']),
              createPostItem(
                  postCategory: '실종신고',
                  content: missingData?['title'],
                  isEndItem: true,
                  likes: missingData?['likes'],
                  comments: missingData?['commentSize'])
            ],
          ),
        )
      ],
    );
  }
}
