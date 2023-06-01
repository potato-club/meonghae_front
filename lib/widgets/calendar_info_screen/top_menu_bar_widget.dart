import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class TopMenuBarWidget extends StatelessWidget {
  const TopMenuBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
                width: 30,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: ArrowSVG(strokeColor: CustomColor.black2))),
          ),
          const Text(
            '새로운 기록',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: CustomColor.black2),
          ),
          const SizedBox(
            width: 30,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '저장',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.gray),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
