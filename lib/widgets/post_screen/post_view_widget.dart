import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
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
    SendAPI.get(
      context: context,
      url: "/community-service/boards",
      request: {'type': type},
      successFunc: (data) => setState(() => posts = data.data['content']),
      errorMsg: "게시글 리스트 호출에 실패하였습니다",
    );
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
