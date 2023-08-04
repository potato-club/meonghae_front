import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/post_comment_model.dart';
import 'package:meonghae_front/themes/customColor.dart';
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
  List<dynamic> cocomment = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    SendAPI.get(
      url: "/community-service/boardComments/${widget.comment.id}/reply",
      successFunc: (data) => setState(() => cocomment = data.data['content']),
      errorMsg: "대댓글 정보 호출에 실패하였습니다",
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
                    ? Image.network(
                        widget.comment.profileUrl!,
                        fit: BoxFit.cover,
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
                              GestureDetector(
                                onTap: () => setState(() => isOpen = !isOpen),
                                child: const Text(
                                  '간략히',
                                  style: TextStyle(
                                      fontSize: 10, color: CustomColor.gray),
                                ),
                              ),
                            ],
                          )
                        : GestureDetector(
                            onTap: () => setState(() => isOpen = !isOpen),
                            child: Text(
                              '댓글 ${widget.comment.replies}개',
                              style: const TextStyle(
                                  fontSize: 10, color: CustomColor.gray),
                            ),
                          )
                    : Container()
              ],
            ),
          ],
        ),
      ),
      Positioned(
          top: 14,
          right: 0,
          child: InkWell(
              onTap: () => widget.setIsCommentMoreModal(true),
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
