import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/comment_widget.dart';

class DetailCommentWidget extends StatefulWidget {
  const DetailCommentWidget({super.key});

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
      child: const Column(
        children: [
          CommentWidget(),
          CommentWidget(),
          CommentWidget(),
          CommentWidget(),
          CommentWidget(),
          SizedBox(height: 74)
        ],
      ),
    );
  }
}
