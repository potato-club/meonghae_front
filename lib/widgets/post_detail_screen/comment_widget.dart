import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/controllers/post_edit_controller.dart';
import 'package:meonghae_front/models/post_comment_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/post_detail_screen/cocoment_widget.dart';
import 'package:meonghae_front/widgets/svg/tiny_more.dart';

class CommentWidget extends StatefulWidget {
  final Function setIsCommentMoreModal;
  final PostCommentModel comment;
  const CommentWidget(
      {super.key, required this.comment, required this.setIsCommentMoreModal});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  bool isOpen = false;
  int p = 1;
  bool hasMore = false;
  List<dynamic> cocomment = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SendAPI.get(
      url: "/community-service/boardComments/${widget.comment.id}/reply",
      params: {'p': p},
      successFunc: (data) => setState(() {
        cocomment.addAll(data.data['content']);
        hasMore = data.data['content'].length == 20;
        if (data.data['content'].length == 20) p++;
      }),
      errorMsg: "대댓글 정보 호출에 실패하였어요",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.symmetric(
            vertical: 12, horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, 6),
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 28,
                height: 28,
                decoration: const BoxDecoration(
                    color: CustomColor.lightGray3, shape: BoxShape.circle),
                child: widget.comment.profileUrl != null
                    ? CachedNetworkImage(
                        imageUrl: widget.comment.profileUrl!,
                        fit: BoxFit.cover,
                        memCacheWidth: 140,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error_outline_outlined,
                          color: CustomColor.brown1,
                        ),
                      )
                    : Transform.scale(
                        scale: 1.8,
                        child: const Image(
                          image: AssetImage(
                            'assets/images/dog_pictures/face.png',
                          ),
                        ),
                      ),
              ),
            ),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.88 - 42,
                    child: Text(
                      widget.comment.isWriter == true ? '글쓴이' : '익명',
                      style:
                          const TextStyle(fontSize: 11, color: CustomColor.red),
                    )),
                const SizedBox(height: 4),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 56,
                  child: Text(widget.comment.comment,
                      style: const TextStyle(fontSize: 13, height: 1.2)),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      widget.comment.date.split('T')[0].replaceAll('-', '/'),
                      style: const TextStyle(
                          fontSize: 11, color: CustomColor.lightGray2),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      widget.comment.date.split('T')[1].substring(0, 5),
                      style: const TextStyle(
                          fontSize: 11, color: CustomColor.lightGray2),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                widget.comment.replies != 0
                    ? isOpen
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...cocomment.map((cocomment) {
                                return CocomentWidget(
                                    cocomment: cocomment,
                                    setIsCommentMoreModal:
                                        widget.setIsCommentMoreModal);
                              }),
                              Padding(
                                padding: const EdgeInsets.only(left: 42),
                                child: Row(
                                  children: [
                                    if (hasMore)
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: GestureDetector(
                                          onTap: () => fetchData(),
                                          child: const Text(
                                            '더보기',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: CustomColor.gray,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ),
                                    GestureDetector(
                                      onTap: () =>
                                          setState(() => isOpen = !isOpen),
                                      child: const Text(
                                        '간략히',
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: CustomColor.gray,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () => setState(() => isOpen = !isOpen),
                            child: Text(
                              '댓글 ${widget.comment.replies}개',
                              style: const TextStyle(
                                fontSize: 11,
                                color: CustomColor.gray,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          )
                    : Container()
              ],
            ),
          ],
        ),
      ),
      if (widget.comment.isWriter)
        Positioned(
            top: 14,
            right: 0,
            child: InkWell(
                onTap: () {
                  Get.find<PostDetailController>()
                      .setCommentId(widget.comment.id, widget.comment.comment);
                  Get.find<PostEditController>()
                      .setCommentId(widget.comment.id);
                  widget.setIsCommentMoreModal(true);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 2,
                        horizontal: MediaQuery.of(context).size.width * 0.06),
                    child: const TinyMoreSVG(color: CustomColor.lightGray2))))
    ]);
  }
}
