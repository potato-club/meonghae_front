import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PencilSVG extends StatelessWidget {
  const PencilSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="19" height="19" viewBox="0 0 19 19" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M18.0925 4.76202C18.0719 4.37375 17.9078 4.00243 17.63 3.71582C17.63 3.71582 17.6287 3.7144 17.6273 3.71299L14.831 0.829944C14.5218 0.513684 14.1237 0.351318 13.7392 0.351318C13.4041 0.351318 13.0812 0.474151 12.8377 0.724053L12.5777 0.99231L11.683 1.87897L3.04907 10.7865L7.96321 15.8579L17.7299 5.76868C17.983 5.50749 18.1102 5.14887 18.0911 4.7606L18.0925 4.76202Z" fill="#999999"/>
      <path d="M2.2597 11.9667L0.300611 17.9672C0.17338 18.3569 0.46478 18.7296 0.828689 18.7296C0.887516 18.7296 0.947712 18.7197 1.00791 18.6986L6.84139 16.6937L2.2597 11.9653V11.9667Z" fill="#999999"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
