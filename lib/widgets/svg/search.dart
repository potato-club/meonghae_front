import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchSVG extends StatelessWidget {
  final Color strokeColor;
  const SearchSVG({super.key, required this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="22" height="20" viewBox="0 0 22 20" fill="none" xmlns="http://www.w3.org/2000/svg">
      <circle cx="8.44444" cy="8.44444" r="7.69444" stroke='#${strokeColor.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-width="1.5"/>
      <path d="M20.631 19.5761C20.9492 19.8413 21.4221 19.7983 21.6873 19.4801C21.9524 19.1619 21.9095 18.689 21.5912 18.4238L20.631 19.5761ZM14.2976 14.2983L20.631 19.5761L21.5912 18.4238L15.2579 13.146L14.2976 14.2983Z" fill='#${strokeColor.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
