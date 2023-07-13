import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class CustomModalWidget {
  static void show(
    BuildContext context,
    String label,
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
            horizontal: MediaQuery.of(context).size.width * 0.16,
          ),
          child: Container(
            width: 60,
            height: 140,
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 20,
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(76, 30),
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          fixedSize: const Size(80, 30),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: CustomColor.brown1,
                          textStyle: TextStyle(
                            fontSize: 13,
                            color: CustomColor.black2,
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Center(
                          child: Text(
                            '아니요',
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
