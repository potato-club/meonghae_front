import 'package:flutter/material.dart';

enum SnackBarType {
  error,
  alarm,
  check,
}

class SnackBarWidget {
  static void show(BuildContext context, SnackBarType type, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
