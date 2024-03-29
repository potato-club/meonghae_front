import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NeckCollarSVG extends StatelessWidget {
  final Color color1;
  final Color color2;
  const NeckCollarSVG({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="45" height="46" viewBox="0 0 45 46" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_300_1814)">
          <path d="M29.62 18.35L14.9 37.19C14.76 37.37 14.6 37.52 14.41 37.64C11.02 30.93 2.42 29.83 2.2 29.77C0.9 29.34 0 28.19 0 26.88V22.13C0 20.54 1.34 19.2 3.06 19.06L6.65 18.79C6.65 18.79 6.66 18.79 6.68 18.78C6.83 18.76 7.41 18.61 7.76 17.39L7.83 17.03C8.07 15.79 8.7 14.62 9.74 13.89C10.98 13.01 13.84 12.64 16.06 12.48C16.42 12.45 16.76 12.33 17.04 12.14C17.42 11.89 17.7 11.52 17.85 11.07L19.62 5.7L21.09 1.26C21.64 -0.42 24.02 -0.42 24.57 1.26L28.28 12.52C28.37 12.78 28.51 13 28.69 13.21C29.03 13.61 29.65 14.58 30.02 16.71C30.13 17.29 29.98 17.89 29.62 18.35Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M44.51 29.9901L37.35 39.0501C36.88 39.6401 36.06 39.8201 35.39 39.4801L23.75 33.6401C22.85 33.1901 22.59 32.0201 23.22 31.2301L40.29 9.61008C41.2 8.45008 43.08 9.05008 43.13 10.5301C43.13 10.5501 43.13 10.5601 43.13 10.5801L44.85 28.8601C44.89 29.2701 44.77 29.6701 44.51 29.9901Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M32.06 41.2898C32.96 41.7398 33.22 42.9098 32.59 43.6998L31.05 45.6398H30.7L14.3 45.2598C12.99 45.2298 12.28 43.7198 13.09 42.6898L18.46 35.8898C18.93 35.2998 19.75 35.1198 20.42 35.4498L32.06 41.2898Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          </g>
          <defs>
          <clipPath id="clip0_300_1814">
          <rect width="44.85" height="45.63" fill="white"/>
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
