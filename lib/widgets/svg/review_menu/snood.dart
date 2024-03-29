import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SnoodSVG extends StatelessWidget {
  final Color color1;
  final Color color2;
  const SnoodSVG({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="41" height="17" viewBox="0 0 41 17" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_300_1830)">
          <path d="M38.41 2.66016H2.06C0.922293 2.66016 0 3.58245 0 4.72016V11.9202C0 13.0579 0.922293 13.9802 2.06 13.9802H38.41C39.5477 13.9802 40.47 13.0579 40.47 11.9202V4.72016C40.47 3.58245 39.5477 2.66016 38.41 2.66016Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M30.91 0H19.86C19.36 0 18.95 0.52 18.95 1.17V15.46C18.95 16.11 19.35 16.63 19.86 16.63H30.91C31.41 16.63 31.82 16.11 31.82 15.46V1.17C31.82 0.52 31.41 0 30.91 0ZM29.2 12.09C29.2 12.73 28.8 13.26 28.29 13.26H22.46C21.96 13.26 21.55 12.73 21.55 12.09V4.55C21.55 3.9 21.95 3.37 22.46 3.37H28.29C28.79 3.37 29.2 3.9 29.2 4.55V12.09Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M24.81 6.54004H20.2C19.5097 6.54004 18.95 7.09968 18.95 7.79004V8.14004C18.95 8.8304 19.5097 9.39004 20.2 9.39004H24.81C25.5004 9.39004 26.06 8.8304 26.06 8.14004V7.79004C26.06 7.09968 25.5004 6.54004 24.81 6.54004Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M4.23999 7.1499H3.95999C3.39114 7.1499 2.92999 7.61105 2.92999 8.1799V8.4599C2.92999 9.02876 3.39114 9.4899 3.95999 9.4899H4.23999C4.80885 9.4899 5.26999 9.02876 5.26999 8.4599V8.1799C5.26999 7.61105 4.80885 7.1499 4.23999 7.1499Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M12.81 7.1499H12.53C11.9611 7.1499 11.5 7.61105 11.5 8.1799V8.4599C11.5 9.02876 11.9611 9.4899 12.53 9.4899H12.81C13.3789 9.4899 13.84 9.02876 13.84 8.4599V8.1799C13.84 7.61105 13.3789 7.1499 12.81 7.1499Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M36.71 7.1499H36.43C35.8612 7.1499 35.4 7.61105 35.4 8.1799V8.4599C35.4 9.02876 35.8612 9.4899 36.43 9.4899H36.71C37.2789 9.4899 37.74 9.02876 37.74 8.4599V8.1799C37.74 7.61105 37.2789 7.1499 36.71 7.1499Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          </g>
          <defs>
          <clipPath id="clip0_300_1830">
          <rect width="40.47" height="16.63" fill="white"/>
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
