import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
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
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aGR3bzk5OUBuYXZlci5jb20iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTY4NjY4NDQwNywiZXhwIjoxNjg2Njg2MjA3fQ.5kSXCxz7xU2wBEjel5ER1SGvAnk5UPCfuNbR66df-lI';

      final response = await dio.get(
        'https://api.meonghae.site/community-service/boards/${widget.id}',
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        setState(() {
          post = data;
        });
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurddred: $error');
    }
  }

  Future<void> fetchReplyData() async {
    try {
      final dio = Dio();
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aGR3bzk5OUBuYXZlci5jb20iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTY4NjY4NDQwNywiZXhwIjoxNjg2Njg2MjA3fQ.5kSXCxz7xU2wBEjel5ER1SGvAnk5UPCfuNbR66df-lI';

      final response = await dio.get(
        'https://api.meonghae.site/community-service/boardComments/${widget.id}',
      );

      if (response.statusCode == 200) {
        final data = response.data;
        setState(() {
          content = data['content'];
        });
        print(content);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('댓글에러: $error');
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
