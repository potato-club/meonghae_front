import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyBottomArrowSVG extends StatelessWidget {
  final Color strokeColor;
  const TinyBottomArrowSVG({super.key, required this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="10" height="6" viewBox="0 0 10 6" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1 1L5 5L9 1" stroke='#${strokeColor.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
