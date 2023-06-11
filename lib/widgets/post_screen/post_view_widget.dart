import 'package:flutter/material.dart';
import 'package:meonghae_front/widgets/post_screen/post_list_item_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_missing_list_item_widget.dart';

class PostViewWidget extends StatelessWidget {
  final String currentSection;
  const PostViewWidget({super.key, required this.currentSection});

  @override
  Widget build(BuildContext context) {
    switch (currentSection) {
      case 'boast':
        return ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 20 : 0,
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                    bottom: 16,
                  ),
                  child: const PostListItemWidget(),
                ),
            itemCount: 10);
      case 'fun':
        return ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 20 : 0,
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                    bottom: 16,
                  ),
                  child: const PostListItemWidget(),
                ),
            itemCount: 10);
      case 'missing':
        return ListView.builder(
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.only(
                    top: index == 0 ? 20 : 0,
                    left: MediaQuery.of(context).size.width * 0.06,
                    right: MediaQuery.of(context).size.width * 0.06,
                    bottom: 16,
                  ),
                  child: const PostMissingListItemWidget(),
                ),
            itemCount: 10);
      default:
        return Container();
    }
  }
}
