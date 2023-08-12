import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class MenuButtonsWidget extends StatelessWidget {
  const MenuButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Widget makeButton(String label, Color fontColor, String page) {
      return ElevatedButton(
        onPressed: () => Get.toNamed(page),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: Size(MediaQuery.of(context).size.width, 65),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06),
          backgroundColor: CustomColor.white,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 15, color: fontColor),
              ),
              const TinyRightArrowSVG(color: CustomColor.gray),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        makeButton('내 정보 수정', CustomColor.black2, AppRoutes.mypageUser),
        makeButton('애완동물 정보 수정', CustomColor.black2, AppRoutes.mypageDog),
        makeButton('회원탈퇴', CustomColor.red, AppRoutes.mypageWithdrawal),
      ],
    );
  }
}
