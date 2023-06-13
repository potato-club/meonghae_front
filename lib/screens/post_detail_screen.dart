import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/custom_under_modal_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_comment_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_content_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/write_comment_bar_widget.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, required this.id});
  final int id;
  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool isPostMoreModalOpen = false;
  void setIsPostMoreModal(bool value) {
    setState(() => isPostMoreModalOpen = value);
  }

  bool isCommentMoreModalOpen = false;
  void setIsCommentMoreModal(bool value) {
    setState(() => isCommentMoreModalOpen = value);
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Map<String, dynamic>? post;

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

        print(post!['images']);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurredd: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    const List<String> dummyImage = ['dummy1', 'dummy2', 'dummy3'];
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: Stack(children: [
        Column(
          children: [
            BannerWidget(
              setIsPostMoreModal: setIsPostMoreModal,
            ),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                if (post != null) // Conditional check
                  DetailContentWidget(post: post, images: dummyImage),
                DetailCommentWidget(
                  id: widget.id,
                  setIsCommentMoreModal: setIsCommentMoreModal,
                ),
              ],
            )))
          ],
        ),
        const Positioned(bottom: 0, child: WriteCommentBarWidget()),
        if (isPostMoreModalOpen)
          Positioned(
              bottom: 0,
              child: CustomUnderModalWidget(
                isOpen: isPostMoreModalOpen,
                onClose: () => setIsPostMoreModal(false),
                label1: '게시물 수정하기',
                label2: '게시물 삭제하기',
                func1: () => {},
                func2: () => {},
              )),
        if (isCommentMoreModalOpen)
          Positioned(
              bottom: 0,
              child: CustomUnderModalWidget(
                isOpen: isCommentMoreModalOpen,
                onClose: () => setIsCommentMoreModal(false),
                label1: '댓글 수정하기',
                label2: '댓글 삭제하기',
                func1: () => {},
                func2: () => {},
              ))
      ]),
    );
  }
}
