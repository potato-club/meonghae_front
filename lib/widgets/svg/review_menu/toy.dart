import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ToySVG extends StatelessWidget {
  final Color color1;
  final Color color2;
  const ToySVG({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="37" height="37" viewBox="0 0 37 37" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_300_1900)">
          <path d="M23.1 33.98C23.24 34.58 22.94 35.2 22.41 35.39C20.88 35.95 19.24 36.25 17.54 36.25C12.28 36.25 7.61999 33.36 4.70999 28.89C4.48999 28.54 4.46999 28.08 4.63999 27.7C9.23999 17.57 9.15999 10.06 7.64999 4.85C7.50999 4.38 7.66999 3.88 8.02999 3.58C10.69 1.33 13.98 0 17.55 0C19.25 0 20.89 0.3 22.42 0.86C23.03 1.08 23.3 1.87 23 2.5C20.61 7.39 18.94 16.69 23.1 33.98Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M3.58999 25.9901C3.21999 26.9201 1.94999 26.9601 1.55999 26.0301C0.55999 23.6201 -0.0100098 20.9001 -0.0100098 18.0201C-0.0100098 13.1801 1.58999 8.78014 4.19999 5.53014C4.77999 4.81014 5.90999 5.10014 6.10999 6.02014C7.16999 10.8601 6.99999 17.4401 3.58999 25.9901Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M36.99 18.0698C36.99 23.7798 34.49 28.8698 30.58 32.1998C29.59 33.0398 28.51 33.7698 27.35 34.3698C26.69 34.7098 25.89 34.3298 25.71 33.6098C21.28 16.3098 23.16 7.07976 25.78 2.26976C26.08 1.70976 26.77 1.47976 27.34 1.77976C28.5 2.37976 29.58 3.10976 30.58 3.95976C34.49 7.27976 36.99 12.3698 36.99 18.0798V18.0698Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          </g>
          <defs>
          <clipPath id="clip0_300_1900">
          <rect width="36.99" height="36.26" fill="white"/>
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
