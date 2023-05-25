import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyMoreSVG extends StatelessWidget {
  final Color color;
  const TinyMoreSVG({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="3" height="12" viewBox="0 0 3 12" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="1.80879" cy="1.86788" r="0.926471" fill='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
      <circle cx="1.80879" cy="6.19161" r="0.926471" fill='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
      <circle cx="1.80879" cy="10.5148" r="0.926471" fill='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
