import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/comment_widget.dart';

class DetailCommentWidget extends StatelessWidget {
  final Function setIsCommentMoreModal;
  const DetailCommentWidget({super.key, required this.setIsCommentMoreModal});

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
      child: Column(
        children: [
          CommentWidget(setIsCommentMoreModal: setIsCommentMoreModal),
          CommentWidget(setIsCommentMoreModal: setIsCommentMoreModal),
          CommentWidget(setIsCommentMoreModal: setIsCommentMoreModal),
          CommentWidget(setIsCommentMoreModal: setIsCommentMoreModal),
          CommentWidget(setIsCommentMoreModal: setIsCommentMoreModal),
          const SizedBox(height: 74)
        ],
      ),
    );
  }
}
