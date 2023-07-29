import 'package:flutter/material.dart';

class PostModel with ChangeNotifier {
  final int id;
  final String profileUrl;
  final String title;
  final String content;
  final int likes;
  final int commentSize;
  final bool hasImage;
  final DateTime date;

  PostModel({
    required this.id,
    required this.profileUrl,
    required this.title,
    required this.content,
    required this.likes,
    required this.commentSize,
    required this.hasImage,
    required this.date,
  });
}
