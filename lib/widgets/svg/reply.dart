import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReplySVG extends StatelessWidget {
  const ReplySVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M13 7.875L6.33333 7.875C4.91885 7.875 3.56229 7.29554 2.5621 6.26409C1.5619 5.23264 1 3.83369 1 2.375V1M13 7.875L9 3.75M13 7.875L9 12" stroke="#727171" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
