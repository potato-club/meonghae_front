import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/home_controller.dart';
import 'package:meonghae_front/models/post_preview_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';
import 'package:meonghae_front/widgets/svg/comment.dart';
import 'package:meonghae_front/widgets/svg/tiny_heart.dart';

class PostContentWidget extends StatefulWidget {
  const PostContentWidget({super.key});

  @override
  State<PostContentWidget> createState() => _PostContentWidgetState();
}

class _PostContentWidgetState extends State<PostContentWidget> {
  Widget createPostItem(
      {required String postCategory,
      required PostPreviewModel postPreview,
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
                  offset: const Offset(0, 1),
                  child: SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.88 - 130,
                    child: Text(
                      postPreview.title ?? "아직 인기 게시글이 없어요",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 12,
                          color: postPreview.title != null
                              ? CustomColor.black1
                              : CustomColor.lightGray2),
                    ),
                  ),
                ),
              ],
            ),
            Transform.translate(
              offset: const Offset(0, 2),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      if (postPreview.likes != null)
                        const SizedBox(
                            width: 9, height: 9, child: TinyHeartSVG()),
                      const SizedBox(width: 2),
                      Text("${postPreview.likes ?? ''}",
                          style: const TextStyle(
                              fontSize: 12, color: CustomColor.gray)),
                    ],
                  ),
                  const SizedBox(width: 6),
                  if (postPreview.commentSize != null)
                    const SizedBox(width: 9, height: 9, child: CommentSVG()),
                  const SizedBox(width: 2),
                  Text("${postPreview.commentSize ?? ''}",
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
        const MainContentLabelWidget(label: "인기 게시글", navyIndex: 1),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: GetX<HomeController>(builder: (controller) {
            if (controller.isPostLoading.value) {
              return const Center(
                  child:
                      LoadingDotWidget(color: CustomColor.brown1, size: 30.0));
            } else {
              return Column(
                children: [
                  createPostItem(
                      postCategory: '멍자랑',
                      postPreview: controller.postPreviewShow.value,
                      isEndItem: false),
                  createPostItem(
                      postCategory: '웃긴멍',
                      postPreview: controller.postPreviewFun.value,
                      isEndItem: false),
                  createPostItem(
                      postCategory: '실종신고',
                      postPreview: controller.postPreviewMissing.value,
                      isEndItem: true)
                ],
              );
            }
          }),
        )
      ],
    );
  }
}
