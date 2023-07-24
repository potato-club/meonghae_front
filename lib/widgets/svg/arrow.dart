import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ArrowSVG extends StatelessWidget {
  final Color strokeColor;

  const ArrowSVG({super.key, required this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="13" height="21" viewBox="0 0 13 21" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M12 20L2 10.5L12 1" stroke='#${strokeColor.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-width="1.5" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
