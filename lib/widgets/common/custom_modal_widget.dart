import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/themes/customColor.dart';

class CustomModalWidget {
  static void show(String label, Function onClick) {
    Get.dialog(
      Dialog(
        elevation: 0, // Customize elevation
        backgroundColor: Colors.transparent,
      barrierColor: CustomColor.black1.withOpacity(0.25),
        child: Center(
          child: Container(
            width: 288,
            height: 166,
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(
              padding: const EdgeInsets.only(
                top: 42,
                bottom: 18,
                left: 19,
                right: 19,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    maxLines: 2,
                    style: const TextStyle(
                    style: const TextStyle(
                      fontSize: 14,
                      color: CustomColor.black2,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(116, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor:
                              CustomColor.lightGray3.withOpacity(0.9),
                          textStyle: const TextStyle(
                          textStyle: const TextStyle(
                            fontSize: 14,
                            color: CustomColor.black2,
                          ),
                        ),
                        onPressed: () => Get.back(),
                        child: const const Center(
                          child: Text(
                            '아니요',
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColor.black2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(116, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: CustomColor.brown1,
                          textStyle: const const TextStyle(
                            fontSize: 14,
                            color: CustomColor.black2,
                          ),
                        ),
                        onPressed: () => onClick(),
                        child: const Center(
                        onPressed: () {
                          onClick();
                          Get.back();
                        },
                        child: const Center(
                          child: Text(
                            '네',
                            style: TextStyle(
                              fontSize: 14,
                              color: CustomColor.black2,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
