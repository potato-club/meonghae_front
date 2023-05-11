import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter/services.dart';
import 'package:meonghae_front/screens/login_screen.dart';

void main() async {
  // 카카오 앱의 클라이언트 ID를 설정
  KakaoSdk.init(nativeAppKey: 'b9af1657c2b23b75e1461b4369ab3dee');
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return const MaterialApp(
      title: 'Meonghae?',
      home: LoginScreen(),
    );
  }
}
