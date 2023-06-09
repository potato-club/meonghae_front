import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarSVG extends StatelessWidget {
  final bool isCurrent;
  const CalendarSVG({super.key, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="22" height="24" viewBox="0 0 22 24" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M20.3092 2.03731H17.8797V0.593379C17.8797 0.265954 17.6096 0 17.277 0H15.7189C15.3864 0 15.1163 0.265954 15.1163 0.593379V2.03731H6.68479V0.593379C6.68479 0.265954 6.4147 0 6.08218 0H4.52405C4.19153 0 3.92143 0.265954 3.92143 0.593379V2.03731H1.60908C0.899445 2.03731 0.319763 2.60811 0.319763 3.30686V7.23094H21.5985V3.30686C21.5985 2.60811 21.0189 2.03731 20.3092 2.03731Z" fill='${isCurrent ? '#F2CB80' : '#BDBDBD'}'/>
      <path d="M0.319763 8.12671V22.0956C0.319763 22.7943 0.899445 23.3651 1.60908 23.3651H20.3092C21.0189 23.3651 21.5985 22.7943 21.5985 22.0956V8.12671H0.319763ZM17.0477 12.5162L11.4662 19.4699C11.2267 19.7697 10.87 19.9541 10.4839 19.978C10.4546 19.9792 10.4253 19.9805 10.396 19.9805C10.0406 19.9805 9.69914 19.8437 9.44306 19.5991L5.73182 16.0376C5.19164 15.5195 5.18144 14.6689 5.70634 14.137C6.23251 13.6039 7.0963 13.5938 7.63649 14.1119L10.2623 16.6322L14.9048 10.849C15.3711 10.2656 16.2298 10.1678 16.8222 10.6282C17.4134 11.0886 17.514 11.9329 17.0464 12.515L17.0477 12.5162Z" fill='${isCurrent ? '#F2CB80' : '#BDBDBD'}'/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}