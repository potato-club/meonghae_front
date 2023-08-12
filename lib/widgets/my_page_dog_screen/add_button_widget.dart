import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class AddButtonWidget extends StatelessWidget {
  const AddButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '폼 추가하기',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: CustomColor.white,
            ),
          ),
          SizedBox(width: 6),
          TinyRightArrowSVG(color: CustomColor.white)
        ],
      ),
    );
  }
}
