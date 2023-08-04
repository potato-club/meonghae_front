import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/comment_widget.dart';

class DetailCommentWidget extends StatefulWidget {
  final Function setIsCommentMoreModal;
  const DetailCommentWidget({super.key, required this.setIsCommentMoreModal});

  @override
  State<DetailCommentWidget> createState() => _DetailCommentWidgetState();
}

class _DetailCommentWidgetState extends State<DetailCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CustomColor.lightGray2,
            width: 0.4,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 74),
        child: GetX<PostDetailController>(builder: (controller) {
          if (controller.isLoading.value) {
            return Container();
          } else {
            return Column(
              children: [
                for (int i = 0; i < controller.comments.length; i++)
                  Column(
                    children: [
                      CommentWidget(
                        comment: controller.comments.value[i],
                        setIsCommentMoreModal: widget.setIsCommentMoreModal,
                      ),
                      if (i == controller.comments.length - 1 &&
                          controller.hasMore.value)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Container(),
                        )
                    ],
                  )
              ],
            );
          }
        }),
      ),
    );
  }
}
