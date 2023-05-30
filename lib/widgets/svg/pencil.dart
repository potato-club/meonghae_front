import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PencilSVG extends StatelessWidget {
  const PencilSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="16" height="17" viewBox="0 0 16 17" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M15.8827 3.93071C15.8644 3.5847 15.7181 3.25378 15.4706 2.99836C15.4706 2.99836 15.4694 2.9971 15.4682 2.99584L12.9761 0.42654C12.7006 0.144696 12.3458 0 12.0032 0C11.7045 0 11.4168 0.109466 11.1997 0.332173L10.9681 0.571236L10.1707 1.3614L2.47638 9.29958L6.85574 13.8191L15.5596 4.82783C15.7852 4.59506 15.8985 4.27546 15.8815 3.92945L15.8827 3.93071Z" fill="#F2CB80"/>
      <path d="M1.77294 10.3518L0.0270447 15.6993C-0.0863408 16.0466 0.173349 16.3788 0.497655 16.3788C0.550081 16.3788 0.603726 16.37 0.657371 16.3511L5.85603 14.5644L1.77294 10.3506V10.3518Z" fill="#F2CB80"/>
      </svg>

      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
