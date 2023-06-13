import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
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
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aGR3bzk5OUBuYXZlci5jb20iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTY4NjY4NDQwNywiZXhwIjoxNjg2Njg2MjA3fQ.5kSXCxz7xU2wBEjel5ER1SGvAnk5UPCfuNbR66df-lI';

      final response = await dio.get(
        'https://api.meonghae.site/community-service/boardComments/${widget.comment['id']}/reply',
      );

      if (response.statusCode == 200) {
        final data = response.data['content'];
        setState(() {
          cocomment = data;
        });
        print('코코멘트: $cocomment');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('대댓글에러: $error');
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
              offset: const Offset(0, 6),
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
                  child: widget.comment['isWriter'] == true
                      ? const Text(
                          '글쓴이',
                          style:
                              TextStyle(fontSize: 11, color: CustomColor.red),
                        )
                      : null, // Omit the child if isWriter is true
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 56,
                  child: Text("${widget.comment['comment']}",
                      style: const TextStyle(fontSize: 12, height: 1.2)),
                ),
                const SizedBox(height: 10),
                isOpen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...cocomment.map((cocomment) {
                            print(cocomment);
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
                        child: const Text(
                          '댓글 32개',
                          style:
                              TextStyle(fontSize: 10, color: CustomColor.gray),
                        ),
                      ),
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
