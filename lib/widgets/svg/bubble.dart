import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BubbleSVG extends StatelessWidget {
  final Color color;
  const BubbleSVG({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="19" height="13" viewBox="0 0 19 13" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1.08037 3.77444C-0.776836 2.80869 -0.0902243 -4.76837e-07 2.00307 -4.76837e-07L18.8218 -4.76837e-07V13L1.08037 3.77444Z" fill="#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
