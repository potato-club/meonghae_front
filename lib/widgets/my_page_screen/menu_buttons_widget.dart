import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/my_page_dog_screen.dart';
import 'package:meonghae_front/screens/my_page_user_screen.dart';
import 'package:meonghae_front/screens/my_page_withdrawal_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class MenuButtonsWidget extends StatelessWidget {
  final Function readUserInfo;
  const MenuButtonsWidget({super.key, required this.readUserInfo});

  @override
  Widget build(BuildContext context) {
    Widget makeButton(String label, Color fontColor, Widget router) {
      return ElevatedButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) => router)),
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
                style: TextStyle(fontSize: 14, color: fontColor),
              ),
              const TinyRightArrowSVG(color: CustomColor.gray),
            ],
          ),
        ),
      );
    }

    return Column(
      children: [
        makeButton(
            '내 정보 수정',
            CustomColor.black2,
            MyPageUserScreen(
              fetchData: readUserInfo,
            )),
        makeButton('애완동물 정보 수정', CustomColor.black2, MyPageDogScreen()),
        makeButton('회원탈퇴', CustomColor.red, MyPageWithdrawalScreen()),
      ],
    );
  }
}
