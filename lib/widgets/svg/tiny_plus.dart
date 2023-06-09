import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyPlusSVG extends StatelessWidget {
  const TinyPlusSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="6" height="6" viewBox="0 0 6 6" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M1 3H5" stroke="#999999" stroke-width="0.6" stroke-linecap="round"/>
        <path d="M3 1L3 5" stroke="#999999" stroke-width="0.6" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
