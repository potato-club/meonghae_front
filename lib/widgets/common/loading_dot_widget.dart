import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDotWidget extends StatefulWidget {
  final Color color;
  const LoadingDotWidget({super.key, required this.color});

  @override
  State<LoadingDotWidget> createState() => _LoadingDotWidgetState();
}

class _LoadingDotWidgetState extends State<LoadingDotWidget> {
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeBounce(
      size: 36.0,
      color: widget.color,
    );
  }
}
