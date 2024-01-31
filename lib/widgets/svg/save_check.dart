import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SaveCheckSVG extends StatelessWidget {
  const SaveCheckSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="24" height="19" viewBox="0 0 24 19" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M1.39748 9.43883C1.08755 9.16402 0.613533 9.19249 0.338729 9.50242C0.0639237 9.81235 0.0923965 10.2864 0.402324 10.5612L1.39748 9.43883ZM0.402324 10.5612L8.8676 18.0671L9.86276 16.9448L1.39748 9.43883L0.402324 10.5612Z" fill="black"/>
      <path d="M23.5789 1.47678C23.8423 1.15704 23.7965 0.684371 23.4768 0.421052C23.157 0.157734 22.6844 0.203476 22.4211 0.52322L23.5789 1.47678ZM22.4211 0.52322L8.42105 17.5232L9.57895 18.4768L23.5789 1.47678L22.4211 0.52322Z" fill="black"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
