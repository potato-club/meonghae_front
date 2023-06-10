import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CancelSVG extends StatelessWidget {
  const CancelSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1 17L17 1" stroke="#191919" stroke-width="1.5" stroke-linecap="round"/>
      <path d="M17 17L1 1" stroke="#191919" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
