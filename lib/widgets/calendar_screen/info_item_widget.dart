import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class InfoItemWidget extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String title;
  final bool isEndItem;
  const InfoItemWidget({
    super.key,
    required this.isEndItem,
    required this.startTime,
    required this.endTime,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isEndItem
            ? null
            : const Border(
                bottom: BorderSide(
                  color: CustomColor.gray,
                  width: 0.4,
                ),
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    startTime,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.black2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    endTime,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.lightGray2,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: CustomColor.black2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
