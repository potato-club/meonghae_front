import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter/services.dart';
import 'package:meonghae_front/screens/register_screen.dart';

void main() async {
  // 카카오 앱의 클라이언트 ID를 설정
  KakaoSdk.init(nativeAppKey: '3b8b2bbfc5c80b80bcdb2749271b736e');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return const MaterialApp(
      title: 'Meonghae?',
      home: RegisterScreen(),
    );
  }
}
