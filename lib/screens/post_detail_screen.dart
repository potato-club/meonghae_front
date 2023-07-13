import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/custom_under_modal_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_comment_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_content_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/write_comment_bar_widget.dart';

class PostDetailScreen extends StatefulWidget {
  final String currentSection;
  final int id;
  final Function fetchData;
  const PostDetailScreen(
      {super.key,
      required this.id,
      required this.currentSection,
      required this.fetchData});
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
  List comments = [];

  void handlePop() {
    widget.fetchData();
    Navigator.pop(context);
  }

  Future<void> fetchData() async {
    try {
      final dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      final response = await dio.get(
        '${baseUrl}community-service/boards/${widget.id}',
      );
      if (response.statusCode == 200) {
        setState(() => post = response.data);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "게시글 정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
    try {
      final dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      final response = await dio.get(
        '${baseUrl}community-service/boardComments/${widget.id}',
      );
      if (response.statusCode == 200) {
        setState(() => comments = response.data['content']);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "댓글 정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: Stack(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(height: 100),
              DetailContentWidget(
                  post: post, fetchData: fetchData, id: widget.id),
              DetailCommentWidget(
                setIsCommentMoreModal: setIsCommentMoreModal,
                comments: comments,
              ),
            ],
          )),
        ),
        Positioned(
            top: 0,
            child: BannerWidget(
              setIsPostMoreModal: setIsPostMoreModal,
              currentSection: widget.currentSection,
              handlePop: handlePop,
            )),
        Positioned(
            bottom: 0,
            child: WriteCommentBarWidget(id: widget.id, fetchData: fetchData)),
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
