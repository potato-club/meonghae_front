import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class UnderBarIconButtonWidget extends StatelessWidget {
  final Widget routePath;
  final Widget iconSVG;
  final String currentScreen;
  final String label;
  const UnderBarIconButtonWidget({
    super.key,
    required this.iconSVG,
    required this.routePath,
    required this.currentScreen,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (currentScreen != label)
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => routePath,
              ),
            )
          }
      },
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
                  color: currentScreen != label
                      ? CustomColor.lightGray2
                      : CustomColor.brown1))
        ],
      ),
    );
  }
}
