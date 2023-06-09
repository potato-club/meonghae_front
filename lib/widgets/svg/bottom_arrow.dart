import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomArrowSVG extends StatelessWidget {
  final double size;
  final Color color;
  const BottomArrowSVG({super.key, required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.string(
          '''
          <svg width="12" height="8" viewBox="0 0 12 8" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="M11 1L6 6L1 1" stroke='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-width="1.5" stroke-linecap="round"/>
          </svg>
          ''',
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }
}
