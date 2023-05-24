import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MoreSVG extends StatelessWidget {
  const MoreSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="3" height="17" viewBox="0 0 3 17" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="1.5" cy="1.5" r="1.5" fill="#191919"/>
      <circle cx="1.5" cy="8.5" r="1.5" fill="#191919"/>
      <circle cx="1.5" cy="15.5" r="1.5" fill="#191919"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
