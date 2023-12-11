import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  SnackBarWidget(SnackBarType alarm, String s);

  static void show(SnackBarType type, String content) {
    if (type == SnackBarType.error) {
      Get.snackbar(
        "",
        content,
        duration: const Duration(milliseconds: 2500),
        barBlur: 0,
        overlayBlur: 0,
        borderColor: CustomColor.error2,
        borderWidth: 1,
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.width * 0.06),
        padding: EdgeInsets.zero,
        backgroundColor: CustomColor.error1.withOpacity(0.6),
        borderRadius: 100,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.ease,
        reverseAnimationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 750),
        titleText: Container(),
        messageText: Container(
          padding:
              EdgeInsets.fromLTRB(Get.width * 0.03, 9, Get.width * 0.03, 11),
          child: Row(
            children: [
              SizedBox(
                width: 26 + Get.width * 0.04,
                height: 22,
                child: const Center(
                  child: ErrorSVG(),
                ),
              ),
              Expanded(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.error3,
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.04)
            ],
          ),
        ),
      );
    } else if (type == SnackBarType.check) {
      Get.snackbar(
        "",
        content,
        duration: const Duration(milliseconds: 2500),
        barBlur: 0,
        overlayBlur: 0,
        borderColor: CustomColor.check2,
        borderWidth: 1,
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.width * 0.06),
        padding: EdgeInsets.zero,
        backgroundColor: CustomColor.check1.withOpacity(0.6),
        borderRadius: 100,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.ease,
        reverseAnimationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 750),
        titleText: Container(),
        messageText: Container(
          padding:
              EdgeInsets.fromLTRB(Get.width * 0.03, 9, Get.width * 0.03, 11),
          child: Row(
            children: [
              SizedBox(
                width: 26 + Get.width * 0.04,
                height: 22,
                child: const Center(
                  child: CheckSVG(),
                ),
              ),
              Expanded(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.check3,
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.04)
            ],
          ),
        ),
      );
    } else {
      Get.snackbar(
        "",
        content,
        duration: const Duration(milliseconds: 2500),
        barBlur: 0,
        overlayBlur: 0,
        borderColor: CustomColor.alarm2,
        borderWidth: 1,
        margin: EdgeInsets.symmetric(
            horizontal: Get.width * 0.06, vertical: Get.width * 0.06),
        padding: EdgeInsets.zero,
        backgroundColor: CustomColor.alarm1.withOpacity(0.6),
        borderRadius: 100,
        snackPosition: SnackPosition.BOTTOM,
        forwardAnimationCurve: Curves.ease,
        reverseAnimationCurve: Curves.ease,
        animationDuration: const Duration(milliseconds: 750),
        titleText: Container(),
        messageText: Container(
          padding:
              EdgeInsets.fromLTRB(Get.width * 0.03, 9, Get.width * 0.03, 11),
          child: Row(
            children: [
              SizedBox(
                width: 26 + Get.width * 0.04,
                height: 22,
                child: const Center(
                  child: AlarmSVG(),
                ),
              ),
              Expanded(
                child: Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.alarm3,
                  ),
                ),
              ),
              SizedBox(width: Get.width * 0.04)
            ],
          ),
        ),
      );
    }
  }
}
