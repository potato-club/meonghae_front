import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/snack_bar/error.dart';
import 'package:meonghae_front/widgets/svg/snack_bar/check.dart';
import 'package:meonghae_front/widgets/svg/snack_bar/alarm.dart';

enum SnackBarType {
  error,
  alarm,
  check,
}

class SnackBarWidget {
  static void show(BuildContext context, SnackBarType type, String content) {
    if (type == SnackBarType.error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CustomColor.error2, width: 1.0),
              color: CustomColor.error1.withOpacity(0.6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 26 + MediaQuery.of(context).size.width * 0.04,
                    height: 22,
                    child: const Center(
                      child: ErrorSVG(),
                    ),
                  ),
                  Expanded(
                    child: Text(content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.error3)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04)
                ],
              ),
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else if (type == SnackBarType.check) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CustomColor.check2, width: 1.0),
              color: CustomColor.check1.withOpacity(0.6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 26 + MediaQuery.of(context).size.width * 0.04,
                    height: 22,
                    child: const Center(
                      child: CheckSVG(),
                    ),
                  ),
                  Expanded(
                    child: Text(content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.check3)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04)
                ],
              ),
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
            decoration: BoxDecoration(
              border: Border.all(color: CustomColor.alarm2, width: 1.0),
              color: CustomColor.alarm1.withOpacity(0.6),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03,
                  vertical: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 26 + MediaQuery.of(context).size.width * 0.04,
                    height: 22,
                    child: const Center(
                      child: AlarmSVG(),
                    ),
                  ),
                  Expanded(
                    child: Text(content,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.alarm3)),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.04)
                ],
              ),
            ),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }
}
