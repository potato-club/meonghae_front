import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/cocoment_widget.dart';
import 'package:meonghae_front/widgets/svg/tiny_more.dart';

class CommentWidget extends StatefulWidget {
  final Function setIsCommentMoreModal;
  final Map<String, dynamic> comment;
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
    try {
      final dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      final response = await dio.get(
        '${baseUrl}community-service/boardComments/${widget.comment['id']}/reply',
      );
      if (response.statusCode == 200) {
        final data = response.data['content'];
        setState(() => cocomment = data);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "대댓글 정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Stack(children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Transform.translate(
              offset: const Offset(0, 2),
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                    color: CustomColor.lightGray3, shape: BoxShape.circle),
                child: Transform.scale(
                  scale: 1.8,
                  child: widget.comment["profileUrl"] != null
                      ? Image.network(
                          widget.comment["profileUrl"],
                          fit: BoxFit.cover,
                        )
                      : const Image(
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
                    width: MediaQuery.of(context).size.width * 0.88 - 38,
                    child: Text(
                      widget.comment['isWriter'] == true ? '글쓴이' : '익명',
                      style: TextStyle(fontSize: 11, color: CustomColor.red),
                    )),
                SizedBox(height: 4),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 56,
                  child: Text("${widget.comment['comment']}",
                      style: const TextStyle(fontSize: 12, height: 1.2)),
                ),
                const SizedBox(height: 10),
                widget.comment['replies'] != 0
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
                              '댓글 ${widget.comment['replies']}개',
                              style: TextStyle(
                                  fontSize: 10, color: CustomColor.gray),
                            ),
                          )
                    : Container()
              ],
            ),
          ],
        ),
        Positioned(
            top: 4,
            right: 0,
            child: InkWell(
                onTap: () => widget.setIsCommentMoreModal(true),
                child: const SizedBox(
                    width: 12,
                    child: TinyMoreSVG(color: CustomColor.lightGray2))))
      ]),
    );
  }
}
