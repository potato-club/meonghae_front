import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/star.dart';

class StarRatingWidget extends StatelessWidget {
  final num rate;
  const StarRatingWidget({super.key, required this.rate});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(5, (index) {
        if (index < rate) {
          // rate 값보다 작은 인덱스에 해당하는 별의 색을 변경
          return const StarSVG(color: CustomColor.brown1);
        } else {
          return const StarSVG(color: CustomColor.lightGray3);
        }
      }),
    );
  }
}
