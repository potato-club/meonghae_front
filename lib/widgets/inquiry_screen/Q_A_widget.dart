import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/gear.dart';
import 'package:meonghae_front/widgets/svg/tiny_bottom_arrow.dart';

class QAWidget extends StatelessWidget {
  final String question;
  final String answer;
  const QAWidget({super.key, required this.question, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(18, 15, 18, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "Q.",
                  style: TextStyle(fontSize: 16, color: CustomColor.black1),
                ),
                const SizedBox(width: 8),
                Text(
                  question,
                  style: const TextStyle(
                      fontSize: 14,
                      color: CustomColor.black1,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "A.",
                  style: TextStyle(fontSize: 16, color: CustomColor.brown1),
                ),
                const SizedBox(width: 8),
                Text(
                  answer,
                  style:
                      const TextStyle(fontSize: 14, color: CustomColor.black1),
                ),
              ],
            ),
          ],
        ));
  }
}
