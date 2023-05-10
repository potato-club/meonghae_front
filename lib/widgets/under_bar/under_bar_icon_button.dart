import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';

class UnderBarIconButtonWidget extends StatelessWidget {
  final Widget? routePath;
  final String label;
  final String iconName;
  final String currentScreen;
  const UnderBarIconButtonWidget({
    super.key,
    required this.label,
    required this.iconName,
    required this.currentScreen,
    this.routePath,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = iconName == currentScreen;
    return GestureDetector(
      onTap: () => {
        if (!isSelected)
          {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => routePath ?? const MainScreen(),
              ),
            )
          }
      },
      child: SizedBox(
        width: 36,
        child: Column(
          children: [
            Opacity(
              opacity: isSelected ? 1 : 0.4,
              child: Image(
                  image: AssetImage(
                      'assets/images/icon/${iconName}_${isSelected ? 'brown' : 'gray'}.png')),
            ),
            Transform.translate(
              offset: const Offset(0, -4),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color:
                      isSelected ? CustomColor.brown1 : CustomColor.lightGray2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
