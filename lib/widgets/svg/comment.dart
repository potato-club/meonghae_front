import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommentSVG extends StatelessWidget {
  const CommentSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
    <svg width="14" height="15" viewBox="0 0 14 15" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path fill-rule="evenodd" clip-rule="evenodd" d="M14 15V1.5C14 1.10218 13.8525 0.720644 13.5899 0.43934C13.3274 0.158035 12.9713 0 12.6 0H1.4C0.63 0 0 0.675 0 1.5V10.5C0 10.8978 0.1475 11.2794 0.41005 11.5607C0.672601 11.842 1.0287 12 1.4 12H11.2L14 15ZM2.45614 4.47368C2.45614 4.18301 2.67607 3.94737 2.94737 3.94737H10.807C11.0783 3.94737 11.2982 4.18301 11.2982 4.47368C11.2982 4.76436 11.0783 5 10.807 5H2.94737C2.67607 5 2.45614 4.76436 2.45614 4.47368ZM5.15789 7.36842C4.8866 7.36842 4.66667 7.60406 4.66667 7.89474C4.66667 8.18541 4.8866 8.42105 5.15789 8.42105L10.807 8.42105C11.0783 8.42105 11.2982 8.18541 11.2982 7.89474C11.2982 7.60406 11.0783 7.36842 10.807 7.36842L5.15789 7.36842Z" fill="#BDBDBD"/>
    </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
