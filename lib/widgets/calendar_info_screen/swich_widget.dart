import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class SwitchWidget extends StatefulWidget {
  final bool isChecked;
  final Function clickSwitch;
  const SwitchWidget(
      {super.key, required this.isChecked, required this.clickSwitch});

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    double thumbPosition = widget.isChecked ? 12.0 : -12.0;
    print(widget.isChecked);
    return InkWell(
      onTap: () {
        setState(() {
          thumbPosition = widget.isChecked ? -12.0 : 12.0;
        });
        widget.clickSwitch(); // clickSwitch 콜백 호출
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        width: 52,
        height: 27,
        decoration: BoxDecoration(
            color:
                widget.isChecked ? CustomColor.brown1 : CustomColor.lightGray1,
            borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.ease,
            transform: Matrix4.translationValues(thumbPosition, 0, 0),
            child: Container(
              width: 23,
              height: 23,
              decoration: const BoxDecoration(
                  color: CustomColor.white, shape: BoxShape.circle),
            ),
          ),
        ),
      ),
    );
  }
}
