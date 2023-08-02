import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class CustomWarningModalWidget {
  static void show(
    BuildContext context,
    String title,
    String content,
    Function onClick,
  ) {
    showDialog(
      context: context,
      barrierColor: CustomColor.black1.withOpacity(0.2),
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: CustomColor.black1.withOpacity(0),
          insetPadding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06,
          ),
          child: Container(
            width: 288,
            height: 208,
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(
                top: 56,
                bottom: 18,
                left: 19,
                right: 19,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.black2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 8),
                      Text(
                        content,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 14,
                          color: CustomColor.gray,
                          height: 1.3,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
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
                          textStyle: TextStyle(
                            fontSize: 14,
                            color: CustomColor.black2,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Center(
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
                          textStyle: TextStyle(
                            fontSize: 13,
                            color: CustomColor.black2,
                          ),
                        ),
                        onPressed: () => onClick(),
                        child: Center(
                          child: Text(
                            '네',
                            style: TextStyle(
                              fontSize: 13,
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
        );
      },
    );
  }
}
