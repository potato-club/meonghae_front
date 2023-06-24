import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/comment_widget.dart';

class DetailCommentWidget extends StatefulWidget {
  final Function setIsCommentMoreModal;
  final int id;
  const DetailCommentWidget(
      {super.key, required this.setIsCommentMoreModal, required this.id});

  @override
  State<DetailCommentWidget> createState() => _DetailCommentWidgetState();
}

class _DetailCommentWidgetState extends State<DetailCommentWidget> {
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchReplyData();
  }

  Map<String, dynamic> post = {};
  List<dynamic> content = [];

  Future<void> fetchData() async {
    try {
      final dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      final response = await dio.get(
        '${baseUrl}community-service/boards/${widget.id}',
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        setState(() => post = data);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "게시글 정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  Future<void> fetchReplyData() async {
    try {
      final dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      final response = await dio.get(
        '${baseUrl}community-service/boardComments/${widget.id}',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        setState(() => content = data['content']);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "댓글 정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

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
          ...content.map((comment) {
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
