import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class MainContentLabelWidget extends StatelessWidget {
  final String routingPath;
  final String label;

  const MainContentLabelWidget(
      {super.key, required this.label, required this.routingPath});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        InkWell(
          onTap: () => Get.toNamed(routingPath),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '더보기',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.gray,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 4),
                    child: TinyRightArrowSVG(
                      color: CustomColor.gray,
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }
}
