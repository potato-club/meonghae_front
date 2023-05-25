import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyHeartSVG extends StatelessWidget {
  const TinyHeartSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="12" height="11" viewBox="0 0 12 11" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M6 11L5.13 10.2087C2.04 7.40926 0 5.55695 0 3.297C0 1.44469 1.452 0 3.3 0C4.344 0 5.346 0.485559 6 1.24687C6.654 0.485559 7.656 0 8.7 0C10.548 0 12 1.44469 12 3.297C12 5.55695 9.96 7.40926 6.87 10.2087L6 11Z" fill="#FF5858"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
