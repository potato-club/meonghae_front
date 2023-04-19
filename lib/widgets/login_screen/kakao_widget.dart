import 'package:flutter/material.dart';
import 'package:meonghae_front/models/loginModel.dart';

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
        fixedSize: const Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        backgroundColor: const Color(0xffFEE500),
      ),
      onPressed: () async {
        await widget.loginModel.login();
        setState(() {});
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo/kakao.png',
            width: 24,
            height: 24,
          ), // 이미지 추가
          const SizedBox(width: 8), // 이미지와 텍스트 사이에 간격 추가
          const Text(
            'KAKAO로 가입하기',
            style: TextStyle(color: Color(0xFF000000)),
          ),
        ],
      ),
    );
  }
}
