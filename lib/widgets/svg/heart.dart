import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeartSVG extends StatelessWidget {
  final bool isFilled; // 사용자가 지정한 stroke 색상
  const HeartSVG({super.key, required this.isFilled});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="15" height="14" viewBox="0 0 15 14" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M6.75223 12.6261L6.75151 12.6254C4.81057 10.835 3.23938 9.38266 2.14758 8.02388C1.06153 6.67224 0.5 5.47273 0.5 4.19618C0.5 2.10734 2.09858 0.5 4.125 0.5C5.27564 0.5 6.39072 1.04752 7.11785 1.90935L7.5 2.36229L7.88215 1.90935C8.60928 1.04752 9.72436 0.5 10.875 0.5C12.9014 0.5 14.5 2.10734 14.5 4.19618C14.5 5.47273 13.9385 6.67224 12.8524 8.02388C11.7606 9.38266 10.1894 10.835 8.24848 12.6254L8.24777 12.6261L7.5 13.3185L6.75223 12.6261Z" stroke="#717071"/>
      </svg>

      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
