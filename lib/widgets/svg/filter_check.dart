import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterCheckSVG extends StatelessWidget {
  final bool isChecked;
  const FilterCheckSVG({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="12" height="11" viewBox="0 0 12 11" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M11 1L4.63636 9L1 4.29412" stroke="${isChecked ? '#191919' : '#BDBDBD'}" stroke-width="1.5" stroke-linecap="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
