import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_more.dart';

class CocomentWidget extends StatefulWidget {
  final Function setIsCommentMoreModal;
  final Map<String, dynamic> cocomment;
  const CocomentWidget(
      {super.key,
      required this.cocomment,
      required this.setIsCommentMoreModal});

  @override
  State<CocomentWidget> createState() => _CocomentWidgetState();
}

class _CocomentWidgetState extends State<CocomentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
                  width: MediaQuery.of(context).size.width * 0.88 - 76,
                  child: (widget.cocomment['isWriter'] == true)
                      ? const Text(
                          '글쓴이',
                          style:
                              TextStyle(fontSize: 11, color: CustomColor.red),
                        )
                      : null,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 98,
                  child: Text('${widget.cocomment['comment']}',
                      style: const TextStyle(fontSize: 12, height: 1.2)),
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
