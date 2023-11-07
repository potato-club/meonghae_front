import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StrollerSVG extends StatelessWidget {
  final Color color1;
  final Color color2;
  const StrollerSVG({super.key, required this.color1, required this.color2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 46,
      height: 46,
      child: Center(
        child: SvgPicture.string(
          '''
          <svg width="47" height="46" viewBox="0 0 47 46" fill="none" xmlns="http://www.w3.org/2000/svg">
          <g clip-path="url(#clip0_300_1879)">
          <path d="M46.27 18.7C46.27 8.37 37.9 0 27.57 0V18.7" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M42.18 45.6298C44.2677 45.6298 45.96 43.9375 45.96 41.8498C45.96 39.7622 44.2677 38.0698 42.18 38.0698C40.0924 38.0698 38.4 39.7622 38.4 41.8498C38.4 43.9375 40.0924 45.6298 42.18 45.6298Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M14.74 45.6298C16.8277 45.6298 18.52 43.9375 18.52 41.8498C18.52 39.7622 16.8277 38.0698 14.74 38.0698C12.6524 38.0698 10.96 39.7622 10.96 41.8498C10.96 43.9375 12.6524 45.6298 14.74 45.6298Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M17.03 20.2099C16.64 20.2099 16.26 20.0399 15.98 19.7399L12.32 15.7599C12.04 15.4599 11.66 15.2899 11.27 15.2899H1.54998C1.04998 15.2899 0.559985 15.0199 0.299985 14.5499C-0.200015 13.6599 -0.0200153 12.7199 0.489985 12.1599C0.789985 11.8299 1.21998 11.6299 1.67998 11.6299H12.69C13.12 11.6299 13.52 11.8299 13.8 12.1799L15.91 14.7799L18.15 17.5499C18.99 18.5899 18.31 20.2299 17.04 20.2299L17.03 20.2099Z" fill='#${color1.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          <path d="M8.88 21.04C8.88 31.37 17.25 39.74 27.58 39.74C37.91 39.74 46.28 31.37 46.28 21.04" fill='#${color2.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
          </g>
          <defs>
          <clipPath id="clip0_300_1879">
          <rect width="46.27" height="45.63" fill="white"/>
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
