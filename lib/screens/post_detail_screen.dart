import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_comment_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/detail_content_widget.dart';
import 'package:meonghae_front/widgets/post_detail_screen/write_comment_bar_widget.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key});

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    const List<String> dummyImage = ['dummy1', 'dummy2', 'dummy3'];
    return const Scaffold(
      backgroundColor: CustomColor.white,
      body: Stack(children: [
        Column(
          children: [
            BannerWidget(),
            Expanded(
                child: SingleChildScrollView(
                    child: Column(
              children: [
                DetailContentWidget(images: dummyImage),
                DetailCommentWidget(),
              ],
            )))
          ],
        ),
        Positioned(bottom: 0, child: WriteCommentBarWidget())
      ]),
    );
  }
}
