import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyRightArrowSVG extends StatelessWidget {
  final Color color;
  const TinyRightArrowSVG({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="9" height="14" viewBox="0 0 9 14" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1 1L7 7L1 13" stroke='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-width="1.5" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
