import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyPictureSVG extends StatelessWidget {
  const TinyPictureSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1.22222 11C0.886112 11 0.598279 10.8802 0.358723 10.6407C0.119168 10.4011 -0.00040637 10.1135 1.03754e-06 9.77778V1.22222C1.03754e-06 0.886112 0.119779 0.598279 0.359334 0.358723C0.59889 0.119168 0.886519 -0.00040637 1.22222 1.03754e-06H9.77778C10.1139 1.03754e-06 10.4017 0.119779 10.6413 0.359334C10.8808 0.59889 11.0004 0.886519 11 1.22222V9.77778C11 10.1139 10.8802 10.4017 10.6407 10.6413C10.4011 10.8808 10.1135 11.0004 9.77778 11H1.22222ZM1.83333 8.55556H9.16667L6.875 5.5L5.04167 7.94444L3.66667 6.11111L1.83333 8.55556Z" fill="#BDBDBD"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
