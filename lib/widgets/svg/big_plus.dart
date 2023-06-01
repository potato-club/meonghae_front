import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BigPlusSVG extends StatelessWidget {
  const BigPlusSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="35" height="35" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M2 17.6565H33" stroke="#999999" stroke-width="3" stroke-linecap="round"/>
      <path d="M17.6565 2L17.6565 33" stroke="#999999" stroke-width="3" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
