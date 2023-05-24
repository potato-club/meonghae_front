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
        return ListView.separated(
            itemBuilder: (context, index) => const PostListItemWidget(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 10);
      case 'fun':
        return ListView.separated(
            itemBuilder: (context, index) => const PostListItemWidget(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 10);
      case 'missing':
        return ListView.separated(
            itemBuilder: (context, index) => const PostMissingListItemWidget(),
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: 10);
      default:
        return Container();
    }
  }
}
