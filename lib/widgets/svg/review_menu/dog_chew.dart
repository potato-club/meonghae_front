import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DogChewSVG extends StatelessWidget {
  final Color color1;
  final Color color2;
  const DogChewSVG({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="42" height="47" viewBox="0 0 42 47" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_300_1869)">
          <path d="M14.62 44.8099C12.07 46.8299 8.36001 46.3899 6.34001 43.8399C5.36001 42.5999 4.95001 41.0699 5.11001 39.6099C3.64001 39.4299 2.26001 38.6799 1.27001 37.4399C-0.749993 34.8799 -0.319993 31.1799 2.23001 29.1599C4.29001 27.5299 7.09001 27.4999 9.15001 28.8799C11.64 30.0299 13.59 28.4199 13.59 28.4199L13.7 28.3699L23.17 20.8799L23.21 20.8299C23.21 20.8299 24.96 19.5099 24.76 17.1499C23.6 14.7299 24.23 11.7499 26.43 10.0199C28.99 7.99986 32.69 8.43986 34.71 10.9899C35.69 12.2299 36.1 13.7599 35.95 15.2199C37.41 15.4099 38.8 16.1499 39.78 17.3999C41.8 19.9599 41.37 23.6599 38.82 25.6799C36.67 27.3799 33.71 27.3399 31.63 25.7599C29.34 24.9799 27.62 26.3999 27.62 26.3999L27.56 26.4199L17.99 33.9899H17.98C17.81 34.1399 15.86 35.7499 16.6 38.4899C16.61 38.5899 16.64 38.6799 16.67 38.7699C17.22 40.9499 16.48 43.3399 14.61 44.8199L14.62 44.8099Z" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M17.49 22.44C17.08 24.26 15.26 25.4 13.44 24.98C12.55 24.78 11.82 24.24 11.37 23.53C10.65 23.98 9.75998 24.14 8.86998 23.94C7.04998 23.52 5.90998 21.71 6.31998 19.89C6.64998 18.42 7.89998 17.4 9.31998 17.27C10.85 16.89 11.14 15.47 11.14 15.47L11.17 15.41L12.71 8.65002V8.62002C12.71 8.62002 13.02 7.40002 12.08 6.42002C10.69 5.75002 9.89998 4.20002 10.26 2.63002C10.67 0.810017 12.48 -0.329983 14.3 0.0900165C15.19 0.290017 15.92 0.830016 16.38 1.54002C17.1 1.10002 17.99 0.930016 18.88 1.13002C20.7 1.55002 21.85 3.35002 21.43 5.18002C21.08 6.71002 19.74 7.76002 18.24 7.80002C16.94 8.28002 16.68 9.53002 16.68 9.53002L16.66 9.56002L15.11 16.39C15.08 16.52 14.79 17.94 16.11 18.9C16.15 18.94 16.2 18.97 16.24 19C17.27 19.78 17.8 21.11 17.5 22.45L17.49 22.44Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          </g>
          <defs>
          <clipPath id="clip0_300_1869">
          <rect width="41.06" height="46.08" fill="white"/>
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
