import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class UnderBarIconButtonWidget extends StatelessWidget {
  final Function onClick;
  final Widget iconSVG;
  final bool isActive;
  final String label;
  const UnderBarIconButtonWidget({
    super.key,
    required this.iconSVG,
    required this.onClick,
    required this.isActive,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 24,
            child: iconSVG,
          ),
          const SizedBox(height: 6),
          Text(label,
              style: TextStyle(
                  fontSize: 10,
                  color:
                      isActive ? CustomColor.brown1 : CustomColor.lightGray2))
        ],
      ),
    );
  }
}
