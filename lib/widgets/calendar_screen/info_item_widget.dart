import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/alarm.dart';
import 'package:meonghae_front/widgets/svg/bell.dart';

class InfoItemWidget extends StatelessWidget {
  final String scheduleTime;
  final String? alarmTime;
  final String? alarmDay;
  final String title;
  final String? memo;
  final bool isEndItem;
  const InfoItemWidget({
    super.key,
    required this.isEndItem,
    required this.title,
    required this.scheduleTime,
    this.alarmTime,
    this.alarmDay,
    this.memo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: isEndItem
            ? null
            : const Border(
                bottom: BorderSide(
                  color: CustomColor.lightGray1,
                  width: 1,
                ),
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 74,
              child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1, color: CustomColor.lightGray1))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const AlarmSVG(),
                          const SizedBox(width: 4),
                          Text(
                            scheduleTime,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.black2,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      if (alarmDay != null)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 1),
                              child: BellSVG(),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$alarmDay 알림,\n$alarmTime',
                              style: const TextStyle(
                                fontSize: 12,
                                color: CustomColor.lightGray2,
                              ),
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.88 - 102,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    if (memo != null)
                      Text(
                        memo!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: CustomColor.gray,
                        ),
                      ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
