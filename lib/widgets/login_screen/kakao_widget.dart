import 'package:flutter/material.dart';
import 'package:meonghae_front/models/loginModel.dart';
import 'package:meonghae_front/themes/customColor.dart';

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
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: CustomColor.kakao,
      ),
      onPressed: () async {
        await widget.loginModel.login();
        setState(() {});
      },
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
              'KAKAO로 가입하기',
              textAlign: TextAlign.center,
              style: TextStyle(color: CustomColor.black1),
            ),
          ),
        ],
      ),
    );
  }
}
