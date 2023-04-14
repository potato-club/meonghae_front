import 'package:flutter/material.dart';

class UnderBarIconButtonWidget extends StatelessWidget {
  final bool isSelected;
  final String label;
  final String iconName;
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
        width: 36,
        child: Column(
          children: [
            Opacity(
              opacity: isSelected ? 1 : 0.4,
              child: Image(
                  image: AssetImage(
                      'assets/images/icon/${iconName}_${isSelected ? 'black' : 'gray'}.png')),
            ),
            Transform.translate(
              offset: const Offset(0, -4),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  color: isSelected ? Colors.black : const Color(0xFFBDBDBD),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
