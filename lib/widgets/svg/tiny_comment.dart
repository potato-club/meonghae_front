import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TinyCommentSVG extends StatelessWidget {
  const TinyCommentSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="11" height="12" viewBox="0 0 11 12" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M11 12V1.2C11 0.88174 10.8841 0.576515 10.6778 0.351472C10.4715 0.126428 10.1917 0 9.9 0H1.1C0.495 0 0 0.54 0 1.2V8.4C0 8.71826 0.115892 9.02349 0.322183 9.24853C0.528473 9.47357 0.808262 9.6 1.1 9.6H8.8L11 12ZM1.92982 3.57895C1.92982 3.34641 2.10263 3.15789 2.31579 3.15789H8.49123C8.70439 3.15789 8.87719 3.34641 8.87719 3.57895C8.87719 3.81149 8.70439 4 8.49123 4H2.31579C2.10263 4 1.92982 3.81149 1.92982 3.57895ZM4.05263 5.89474C3.83947 5.89474 3.66667 6.08325 3.66667 6.31579C3.66667 6.54833 3.83947 6.73684 4.05263 6.73684L8.49123 6.73684C8.70439 6.73684 8.87719 6.54833 8.87719 6.31579C8.87719 6.08325 8.70439 5.89474 8.49123 5.89474L4.05263 5.89474Z" fill="#BDBDBD"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
