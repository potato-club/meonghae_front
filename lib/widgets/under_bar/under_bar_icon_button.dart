import 'package:flutter/material.dart';

class UnderBarIconButtonWidget extends StatelessWidget {
  final Widget routePath;
  final Widget iconSVG;
  final bool isCurrent;
  const UnderBarIconButtonWidget({
    super.key,
    required this.iconSVG,
    required this.routePath,
    required this.isCurrent,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        if (!isCurrent)
          {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => routePath,
              ),
            )
          }
      },
      child: SizedBox(
        width: 36,
        child: iconSVG,
      ),
    );
  }
}
