import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/themes/customColor.dart';

class UnderBarIconButtonWidget extends StatelessWidget {
  final Function onClick;
  final Widget iconSVG;
  final String currentScreen;
  final String label;
  const UnderBarIconButtonWidget({
    super.key,
    required this.iconSVG,
    required this.onClick,
    required this.currentScreen,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            child: iconSVG,
          ),
          const SizedBox(height: 6),
          Text(label,
              style: TextStyle(
                  fontSize: 10,
                  color: !currentScreen.contains(label)
                      ? CustomColor.lightGray2
                      : CustomColor.brown1))
        ],
      ),
    );
  }
}
