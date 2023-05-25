import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/cocoment_widget.dart';
import 'package:meonghae_front/widgets/svg/tiny_more.dart';

class CommentWidget extends StatefulWidget {
  final Function setIsCommentMoreModal;
  const CommentWidget({super.key, required this.setIsCommentMoreModal});

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  bool isOpen = false;
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
                    width: 24,
                    height: 24,
                    decoration: const BoxDecoration(
                        color: CustomColor.lightGray3, shape: BoxShape.circle),
                    child: Transform.scale(
                        scale: 1.8,
                        child: const Image(
                          image: AssetImage(
                            'assets/images/dog_pictures/face.png',
                          ),
                        )))),
            const SizedBox(width: 14),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 38,
                  child: const Text('글쓴이',
                      style: TextStyle(fontSize: 11, color: CustomColor.red)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 56,
                  child: const Text('발견하시게 되면, 010-1234-5678로 연락 부탁드립니다',
                      style: TextStyle(fontSize: 12, height: 1.2)),
                ),
                const SizedBox(height: 10),
                isOpen
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CocomentWidget(
                              setIsCommentMoreModal:
                                  widget.setIsCommentMoreModal),
                          CocomentWidget(
                              setIsCommentMoreModal:
                                  widget.setIsCommentMoreModal),
                          CocomentWidget(
                              setIsCommentMoreModal:
                                  widget.setIsCommentMoreModal),
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
