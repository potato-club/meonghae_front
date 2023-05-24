import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/more.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key});

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
                const Text('글쓴이',
                    style: TextStyle(fontSize: 11, color: CustomColor.red)),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 68,
                  child: const Text(
                      '발견하시게 되면, 010-1234-5678로 연락 부탁드립니다발견하시게 되면, 010-1234-5678로 연락 부탁드립니다',
                      style: TextStyle(fontSize: 12, height: 1.2)),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => setState(() => isOpen = !isOpen),
                  child: const Text(
                    '댓글 32개',
                    style: TextStyle(fontSize: 10, color: CustomColor.gray),
                  ),
                ),
              ],
            ),
          ],
        ),
        Positioned(
            top: 2,
            right: 0,
            child: GestureDetector(
                child: const MoreSVG(color: CustomColor.lightGray2)))
      ]),
    );
  }
}
