import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CameraSVG extends StatelessWidget {
  const CameraSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="24" height="20" viewBox="0 0 24 20" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M7.83691 1.18765C8.01214 0.866391 8.34886 0.666504 8.7148 0.666504H15.2851C15.6511 0.666504 15.9878 0.866391 16.163 1.18765L17.3333 3.33317H6.66662L7.83691 1.18765ZM0 4.33331C0 3.78102 0.447715 3.33331 1 3.33331H23C23.5523 3.33331 24 3.78102 24 4.33331V18.3333C24 18.8856 23.5523 19.3333 23 19.3333H0.999999C0.447714 19.3333 0 18.8856 0 18.3333V4.33331ZM12 16.6666C14.9455 16.6666 17.3333 14.2788 17.3333 11.3333C17.3333 8.38775 14.9455 5.99993 12 5.99993C9.05447 5.99993 6.66665 8.38775 6.66665 11.3333C6.66665 14.2788 9.05447 16.6666 12 16.6666Z" fill="#999999"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
