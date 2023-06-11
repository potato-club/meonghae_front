// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:meonghae_front/models/loginModel.dart';
import 'package:meonghae_front/screens/select_screen.dart';
import 'package:meonghae_front/screens/video_player_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class KakaoButton extends StatefulWidget {
  final LoginModel loginModel;
  const KakaoButton({
    super.key,
    required this.loginModel,
  });

  @override
  State<KakaoButton> createState() => _KakaoButtonState();
}

class _KakaoButtonState extends State<KakaoButton> {
  void handleLogin() async {
    Map<String, dynamic> result = await widget.loginModel.login();
    if (result['success']) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                result['response']['responseCode'] == "201_CREATED"
                    ? SelectScreen(email: result['response']['email'])
                    : const VideoPlayerScreen(),
          ));
    } else {
      SnackBarWidget.show(context, SnackBarType.error, result['error']);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.145),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: const Size(270, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: CustomColor.kakao,
        ),
        onPressed: handleLogin,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/logo/kakao.png',
                width: 24,
                height: 24,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: CustomColor.gray.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(1)),
                width: 1,
                height: 30),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                '카카오 로그인',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: CustomColor.black2),
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
