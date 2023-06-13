import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/widgets/post_screen/post_missing_list_item_widget.dart';

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
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aGR3bzk5OUBuYXZlci5jb20iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTY4NjY1MDAxNywiZXhwIjoxNjg2NjUxODE3fQ.gieEpzu3jn6G-qYhr4zAHUo0ccz19YmRNcD_sgRiJPw';

      String type;
      switch (widget.currentSection) {
        case 'boast':
          type = '1';
          break;
        case 'fun':
          type = '2';
          break;
        case 'missing':
          type = '3';
          break;
        default:
          type = '1';
      }

      final response = await dio.get(
        'https://api.meonghae.site/community-service/boards',
        queryParameters: {'type': type},
      );

      if (response.statusCode == 200) {
        final data = response.data['content'];
        setState(() {
          posts = data;
        });
        print(posts);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error occurred: $error');
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
                  child: PostMissingListItemWidget(
                    postData: posts[index],
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
                  child: PostMissingListItemWidget(
                    postData: posts[index],
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
                  child: PostMissingListItemWidget(
                    postData: posts[index],
                  ),
                ),
            itemCount: posts.length);
      default:
        return Container();
    }
  }
}
