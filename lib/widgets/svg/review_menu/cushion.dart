import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CushionSVG extends StatelessWidget {
  const CushionSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="49" height="35" viewBox="0 0 49 35" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_300_1837)">
          <path d="M48.29 28.5C48.31 28.9 48.2 29.27 48.02 29.58C47.4 31.58 37.14 34.03 24.36 34.03C11.58 34.03 0.930015 31.58 0.270015 29.59C0.0800152 29.28 -0.0199848 28.9 1.51964e-05 28.5C0.770015 12.6 11.28 0 24.14 0C37 0 47.52 12.6 48.28 28.5H48.29Z" fill="#727171"/>
          <path d="M37.94 22.1199C37.94 22.5699 37.68 22.9699 37.3 23.0199C35.37 23.2699 33.88 24.2399 32.79 25.3699C31.78 26.3799 31.11 27.5399 30.69 28.3699C30.43 28.9099 29.8 28.9398 29.47 28.4599C28.62 27.2199 27.75 26.1099 26.87 25.1099C19.18 16.3399 10.73 16.2099 8.22 16.3899C7.81 16.4199 7.45 16.0399 7.44 15.5499V15.4899C7.44 15.0399 7.75 14.6399 8.13 14.6199C10.92 14.4399 21.14 14.5999 29.44 25.0699C29.48 25.1199 29.51 25.1499 29.56 25.1899C29.8 25.3899 30.11 25.3999 30.35 25.2199C30.43 25.1599 30.52 25.0799 30.57 24.9799C31.41 23.4999 33.41 20.8199 37.07 20.3399C37.5 20.2799 37.88 20.6799 37.9 21.1999L37.93 22.1099L37.94 22.1199Z" fill="#DCDDDD"/>
          </g>
          <defs>
          <clipPath id="clip0_300_1837">
          <rect width="48.29" height="34.03" fill="white"/>
          </clipPath>
          </defs>
          </svg>
          ''',
          allowDrawingOutsideViewBox: true,
        ),
      ),
    );
  }
}
