import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AlarmSVG extends StatelessWidget {
  const AlarmSVG({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="9" height="10" viewBox="0 0 9 10" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M7.24997 0.000377588C7.59298 0.000344809 7.92844 0.106435 8.21465 0.30546C8.50085 0.504485 8.72517 0.787667 8.85973 1.1198C8.99429 1.45194 9.03316 1.81838 8.97149 2.17358C8.90982 2.52878 8.75034 2.85706 8.51288 3.11763C8.83405 3.78228 9.00093 4.51763 8.99984 5.26333C9.00052 5.9222 8.87028 6.57393 8.61748 7.17667C8.36469 7.77941 7.99493 8.31982 7.53195 8.7632L7.85343 9.10161C7.9445 9.20087 7.99489 9.33381 7.99375 9.47181C7.99261 9.6098 7.94003 9.7418 7.84734 9.83938C7.75464 9.93696 7.62924 9.99231 7.49815 9.99351C7.36706 9.99471 7.24077 9.94166 7.14648 9.84579L6.71251 9.38897C6.03771 9.79073 5.27542 10.0013 4.50017 9.99999C3.72492 10.0013 2.96263 9.79073 2.28783 9.38897L1.85387 9.84579C1.75957 9.94166 1.63328 9.99471 1.50219 9.99351C1.3711 9.99231 1.24571 9.93696 1.15301 9.83938C1.06031 9.7418 1.00773 9.6098 1.00659 9.47181C1.00545 9.33381 1.05585 9.20087 1.14692 9.10161L1.4684 8.7632C1.00542 8.31982 0.635656 7.77941 0.38286 7.17667C0.130064 6.57393 -0.000176833 5.9222 0.000503007 5.26333C-0.000627048 4.51763 0.166261 3.78227 0.487467 3.11763C0.321947 2.93611 0.193509 2.72082 0.110073 2.48504C0.0266381 2.24925 -0.0100251 1.99798 0.00234513 1.7467C0.0147153 1.49543 0.0758565 1.24949 0.181998 1.02405C0.288139 0.798607 0.43703 0.598446 0.619488 0.435911C0.801946 0.273376 1.0141 0.151912 1.24287 0.0790114C1.47164 0.00611086 1.71217 -0.016681 1.94963 0.0120417C2.18709 0.0407644 2.41644 0.120393 2.62354 0.246015C2.83064 0.371638 3.01109 0.540591 3.15377 0.742454C3.58956 0.599001 4.04357 0.52624 4.50017 0.526673C4.96914 0.526673 5.4211 0.601933 5.84657 0.742454C6.00923 0.512031 6.22089 0.324898 6.46458 0.196037C6.70828 0.0671769 6.97725 0.000168717 7.24997 0.000377588ZM4.50017 2.63186C4.37771 2.63187 4.25952 2.6792 4.16801 2.76486C4.0765 2.85052 4.01804 2.96855 4.00371 3.09658L4.00021 3.15815V5.25597C3.99855 5.37303 4.0341 5.48732 4.1012 5.58069L4.1462 5.63542L5.19912 6.74328C5.28888 6.83867 5.40989 6.89434 5.53737 6.89889C5.66485 6.90345 5.78916 6.85654 5.88486 6.76777C5.98056 6.679 6.04041 6.55508 6.05216 6.42138C6.06391 6.28768 6.02667 6.15431 5.94807 6.04857L5.90607 5.9991L5.00014 5.04545V3.15815C5.00014 3.01857 4.94746 2.8847 4.8537 2.786C4.75994 2.6873 4.63277 2.63186 4.50017 2.63186Z" fill="#191919"/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
