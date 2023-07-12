import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_list_item_widget.dart';

class PostViewWidget extends StatefulWidget {
  final String currentSection;
  const PostViewWidget({super.key, required this.currentSection});

  @override
  State<PostViewWidget> createState() => _PostViewWidgetState();
}

class _PostViewWidgetState extends State<PostViewWidget> {
  List<dynamic> posts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  void didUpdateWidget(covariant PostViewWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.currentSection != oldWidget.currentSection) {
      fetchData();
    }
  }

  Future<void> fetchData() async {
    try {
      final dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      int type;
      switch (widget.currentSection) {
        case 'boast':
          type = 1;
          break;
        case 'fun':
          type = 2;
          break;
        case 'missing':
          type = 3;
          break;
        default:
          type = 1;
      }
      final response = await dio.get(
        '${baseUrl}community-service/boards',
        queryParameters: {'type': type},
      );
      if (response.statusCode == 200) {
        setState(() => posts = response.data['content']);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "게시글 리스트 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.currentSection) {
      case 'boast':
        return ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 20 : 0,
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                    bottom: 16,
                  ),
                  child: PostListItemWidget(
                    postData: posts[index],
                    currentSection: '멍자랑',
                    fetchData: fetchData,
                  ),
                ),
            itemCount: posts.length);
      case 'fun':
        return ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 20 : 0,
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                    bottom: 16,
                  ),
                  child: PostListItemWidget(
                    postData: posts[index],
                    currentSection: '웃긴멍',
                    fetchData: fetchData,
                  ),
                ),
            itemCount: posts.length);
      case 'missing':
        return ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 20 : 0,
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                    bottom: 16,
                  ),
                  child: PostListItemWidget(
                    postData: posts[index],
                    currentSection: '실종신고',
                    fetchData: fetchData,
                  ),
                ),
            itemCount: posts.length);
      default:
        return Container();
    }
  }
}
