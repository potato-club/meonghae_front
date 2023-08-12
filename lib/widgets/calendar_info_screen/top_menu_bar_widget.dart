import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/saveCheck.dart';

class TopMenuBarWidget extends StatelessWidget {
  final Function handleSave;
  const TopMenuBarWidget({super.key, required this.handleSave});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => Get.back(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: 20,
                ),
                child: const SizedBox(
                    width: 24,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: ArrowSVG(strokeColor: CustomColor.black2))),
              ),
            ),
            const Text(
              '새로운 기록',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: CustomColor.black2),
            ),
            InkWell(
              onTap: () => handleSave(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                  vertical: 20,
                ),
                child: const SizedBox(
                  width: 24,
                  child: Align(
                      alignment: Alignment.centerRight, child: SaveCheckSVG()),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
