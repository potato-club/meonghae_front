import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CheckSVG extends StatelessWidget {
  final Color color;
  const CheckSVG({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="10" height="9" viewBox="0 0 10 9" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M8.74746 0.566499C8.85819 0.499807 8.99045 0.478591 9.11648 0.507304C9.24252 0.536016 9.35254 0.612425 9.42346 0.720499L9.91845 1.4755C9.98312 1.57418 10.0108 1.69254 9.99662 1.80966C9.98244 1.92678 9.9273 2.03511 9.84095 2.1155L9.83946 2.1175L9.83246 2.124L9.80395 2.1505L9.69145 2.258C9.06895 2.8618 8.46533 3.48476 7.88146 4.126C6.78296 5.334 5.47846 6.915 4.60046 8.449C4.35546 8.877 3.75696 8.969 3.40196 8.5995L0.159457 5.2305C0.112989 5.1822 0.0767063 5.12505 0.0527648 5.06245C0.0288232 4.99985 0.0177116 4.93308 0.0200904 4.8661C0.0224693 4.79912 0.0382899 4.7333 0.0666121 4.67255C0.0949343 4.61181 0.13518 4.55738 0.184957 4.5125L1.16496 3.6285C1.25108 3.55085 1.36151 3.50556 1.47734 3.50036C1.59318 3.49516 1.70723 3.53038 1.79996 3.6L3.45446 4.8405C6.03846 2.292 7.50446 1.314 8.74746 0.566499Z" fill='#${color.value.toRadixString(16).padLeft(8, '0').substring(2)}'/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
