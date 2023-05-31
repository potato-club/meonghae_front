import 'package:flutter/material.dart';

class SnackBarWidget {
  static void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('모두 입력해주세요'),
        duration: Duration(seconds: 2),
      ),
    );
  }
}
