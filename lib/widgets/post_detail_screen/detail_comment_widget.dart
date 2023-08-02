import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/comment_widget.dart';

class DetailCommentWidget extends StatefulWidget {
  final Function setIsCommentMoreModal;
  final List comments;
  const DetailCommentWidget(
      {super.key, required this.setIsCommentMoreModal, required this.comments});

  @override
  State<DetailCommentWidget> createState() => _DetailCommentWidgetState();
}

class _DetailCommentWidgetState extends State<DetailCommentWidget> {
  @override
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
          ...widget.comments.map((comment) {
            return CommentWidget(
                comment: comment,
                setIsCommentMoreModal: widget.setIsCommentMoreModal);
          }).toList(),
          const SizedBox(height: 74)
        ],
      ),
    );
  }
}
