import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/cancel.dart';
import 'package:meonghae_front/widgets/svg/reply.dart';
import 'package:meonghae_front/widgets/svg/send.dart';

class WriteCommentBarWidget extends StatefulWidget {
  const WriteCommentBarWidget({super.key});

  @override
  State<WriteCommentBarWidget> createState() => _WriteCommentBarWidgetState();
}

class _WriteCommentBarWidgetState extends State<WriteCommentBarWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<PostDetailController>(builder: (controller) {
      return Container(
        decoration: BoxDecoration(
          color: CustomColor.white,
          boxShadow: [
            BoxShadow(
                color: CustomColor.black1.withOpacity(0.2),
                offset: const Offset(0, 8),
                blurRadius: 20,
                spreadRadius: 0)
          ],
        ),
        height: controller.replyMode.value ? 105 : 74,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (controller.replyMode.value)
                    Padding(
                        padding: const EdgeInsets.only(right: 12, top: 5),
                        child: Text(controller.replyComment.value,
                            style: const TextStyle(fontSize: 13, height: 1.2))),
                  Stack(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: controller.replyMode.value ? 20 : 0),
                      child: SizedBox(
                        height: 44,
                        child: TextFormField(
                          controller: controller.textController,
                          decoration: InputDecoration(
                            hintText: controller.replyMode.value
                                ? '대댓글 입력하기'
                                : '댓글 입력하기',
                            alignLabelWithHint: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            filled: true,
                            fillColor: CustomColor.ivory2,
                            contentPadding:
                                const EdgeInsets.only(left: 14, right: 45),
                            hintStyle: const TextStyle(
                              color: CustomColor.gray,
                              fontSize: 14,
                            ),
                            errorStyle: const TextStyle(
                                fontSize: 11, color: Colors.transparent),
                          ),
                          style: const TextStyle(fontSize: 14),
                          keyboardType: TextInputType.text,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: InkWell(
                        onTap: () {
                          if (controller.replyMode.value) {
                            controller
                                .postReply(controller.textController.text);
                            controller.replyMode(false);
                          } else {
                            controller
                                .postComment(controller.textController.text);
                          }
                          FocusScope.of(context).unfocus();
                          controller.textController.clear();
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: const SizedBox(
                          height: 44,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 14),
                            child: SendSVG(strokeColor: CustomColor.lightGray2),
                          ),
                        ),
                      ),
                    ),
                    if (controller.replyMode.value)
                      const Positioned(left: 0, top: 0, child: ReplySVG())
                  ]),
                ],
              ),
            ),
            if (controller.replyMode.value)
              Positioned(
                right: 0,
                child: InkWell(
                  onTap: () {
                    controller.replyMode(false);
                    FocusScope.of(context).unfocus();
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: 15),
                    child: const SizedBox(width: 14, child: CancelSVG()),
                  ),
                ),
              ),
          ],
        ),
      );
    });
  }
}
