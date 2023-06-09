import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class NoInfoWidget extends StatelessWidget {
  const NoInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 645,
        child: const Align(
          child: Text(
            '저장된 기록이 없습니다',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: CustomColor.lightGray1,
            ),
          ),
        ),
      ),
    );
  }
}
