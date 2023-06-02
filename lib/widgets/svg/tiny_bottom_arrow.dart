import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyBottomArrowSVG extends StatelessWidget {
  const TinyBottomArrowSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="10" height="6" viewBox="0 0 10 6" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1 1L5 5L9 1" stroke="#999999" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
