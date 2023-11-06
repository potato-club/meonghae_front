import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendSVG extends StatelessWidget {
  final Color strokeColor;
  const SendSVG({super.key, required this.strokeColor});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="23" height="21" viewBox="0 0 23 21" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M4.30212 10.1421L21.2842 10.1421M4.30212 10.1421L1.60042 18.2472C1.56038 18.355 1.55213 18.472 1.57664 18.5843C1.60115 18.6967 1.6574 18.7996 1.73869 18.8809C1.81999 18.9622 1.92291 19.0184 2.03524 19.0429C2.14756 19.0674 2.26456 19.0592 2.37233 19.0191L21.2842 10.1421M4.30212 10.1421L1.60042 2.03704C1.56038 1.92927 1.55213 1.81227 1.57664 1.69994C1.60115 1.58762 1.6574 1.48469 1.73869 1.4034C1.81999 1.3221 1.92291 1.26586 2.03524 1.24135C2.14756 1.21683 2.26456 1.22509 2.37233 1.26513L21.2842 10.1421" stroke='#${strokeColor.value.toRadixString(16).padLeft(8, '0').substring(2)}' stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
