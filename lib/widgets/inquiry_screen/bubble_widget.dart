import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/inquiry_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/bubble.dart';

class BubbleWidget extends StatefulWidget {
  final bool isAnswer;
  final bool needMail;
  final String text;
  const BubbleWidget(
      {super.key,
      required this.isAnswer,
      required this.text,
      required this.needMail});

  @override
  State<BubbleWidget> createState() => _BubbleWidgetState();
}

class _BubbleWidgetState extends State<BubbleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: Align(
        alignment:
            widget.isAnswer ? Alignment.centerLeft : Alignment.centerRight,
        child: Row(
          mainAxisAlignment:
              widget.isAnswer ? MainAxisAlignment.start : MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.isAnswer)
              Transform.translate(
                  offset: const Offset(1, 10),
                  child: const BubbleSVG(color: CustomColor.brown1)),
            Container(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.6),
              decoration: BoxDecoration(
                  color:
                      widget.isAnswer ? CustomColor.brown1 : CustomColor.white,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(
                  children: [
                    Text(widget.text,
                        style: const TextStyle(fontSize: 12), softWrap: true),
                    if (widget.isAnswer && widget.needMail)
                      Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: InkWell(
                          onTap: () {
                            Get.find<InquiryController>().sendEmail();
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.6 - 10,
                            height: 46,
                            decoration: BoxDecoration(
                                color: CustomColor.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.mail_outlined, size: 16),
                                SizedBox(width: 2),
                                Text("메일로 문의하기",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            ),
            if (!widget.isAnswer)
              Transform.translate(
                  offset: const Offset(-1, 10),
                  child: Transform.scale(
                      scaleX: -1,
                      child: const BubbleSVG(color: CustomColor.white))),
          ],
        ),
      ),
    );
  }
}
