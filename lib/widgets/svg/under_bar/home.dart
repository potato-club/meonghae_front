import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSVG extends StatelessWidget {
  final bool isCurrent;
  const HomeSVG({super.key, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M21.5985 9.58328V19.8601C21.5985 20.8586 20.8101 21.6668 19.8389 21.6668H14.2167V14.8704C14.2167 13.2161 12.7633 11.8678 10.9597 11.8678C9.15613 11.8678 7.70161 13.2161 7.70161 14.8704V21.6668H2.07944C1.10699 21.6668 0.319763 20.8574 0.319763 19.8601V9.58328C0.319763 9.04323 0.556049 8.53122 0.968065 8.18987L9.84718 0.744936C10.4955 0.196349 11.4228 0.196349 12.0711 0.744936L20.9502 8.18987C21.3622 8.53122 21.5985 9.04445 21.5985 9.58328Z" fill='${isCurrent ? '#F2CB80' : '#BDBDBD'}'/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
