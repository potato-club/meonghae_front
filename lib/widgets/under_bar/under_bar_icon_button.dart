import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UnderBarIconButtonWidget extends StatelessWidget {
  final bool isSelected;
  final String label;
  final IconData iconName;
  const UnderBarIconButtonWidget({
    super.key,
    required this.isSelected,
    required this.label,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: SizedBox(
        width: 30,
        child: Column(
          children: [
            FaIcon(
              iconName,
              size: 20,
              color: isSelected ? Colors.black : const Color(0xFFBDBDBD),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Colors.black : const Color(0xFFBDBDBD),
              ),
            )
          ],
        ),
      ),
    );
  }
}
