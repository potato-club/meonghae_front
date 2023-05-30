import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/review_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';

class MenuButtonsWidget extends StatelessWidget {
  final Widget widget1;
  final Widget widget2;
  final Widget widget3;
  final String label1;
  final String label2;
  final String label3;
  const MenuButtonsWidget({
    super.key,
    required this.widget1,
    required this.widget2,
    required this.widget3,
    required this.label1,
    required this.label2,
    required this.label3,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.025,
          vertical: MediaQuery.of(context).size.height * 0.035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ReviewScreen(menuValue: label1))),
            child: Column(
              children: [
                widget1,
                Text(
                  label1,
                  style:
                      const TextStyle(color: CustomColor.black4, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 62,
            decoration: const BoxDecoration(color: CustomColor.lightGray1),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ReviewScreen(menuValue: label2))),
            child: Column(
              children: [
                widget2,
                Text(
                  label2,
                  style:
                      const TextStyle(color: CustomColor.black4, fontSize: 10),
                ),
              ],
            ),
          ),
          Container(
            width: 1,
            height: 62,
            decoration: const BoxDecoration(color: CustomColor.lightGray1),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) =>
                    ReviewScreen(menuValue: label3))),
            child: Column(
              children: [
                widget3,
                Text(
                  label3,
                  style:
                      const TextStyle(color: CustomColor.black4, fontSize: 10),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
