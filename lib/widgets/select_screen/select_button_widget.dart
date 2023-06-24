import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class SelectButtonWidget extends StatelessWidget {
  final String content;
  final Widget routingWidget;

  const SelectButtonWidget(
      {super.key, required this.content, required this.routingWidget});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => routingWidget))
      },
      child: Container(
          width: 270,
          height: 48,
          decoration: BoxDecoration(
            color: CustomColor.brown1,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          )),
    );
  }
}
