import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
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
    return GetX<PostDetailController>(builder: (controller) {
      if (controller.isLoading.value) {
        return SizedBox(
            height: MediaQuery.of(context).size.height - 178,
            child: const Center(
                child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(CustomColor.brown1),
              strokeWidth: 5,
            )));
      } else {
        return Container(
          decoration: const BoxDecoration(
            border: Border(
              top: BorderSide(
                color: CustomColor.lightGray1,
                width: 1,
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(bottom: 78),
            child: Column(
              children: [
                for (int i = 0; i < controller.comments.length; i++)
                  Column(
                    children: [
                      CommentWidget(
                          comment: controller.comments[i],
                          setIsCommentMoreModal: widget.setIsCommentMoreModal),
                    ],
                  )
              ],
            ),
          ),
        );
      }
    });
  }
}
