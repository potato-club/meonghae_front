import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlusSVG extends StatelessWidget {
  final Color color;
  const PlusSVG({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="21" height="21" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1 10.5H20" stroke='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-width="1.5" stroke-linecap="round"/>
      <path d="M10.5 20L10.5 1" stroke='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-width="1.5" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
