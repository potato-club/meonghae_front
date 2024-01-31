import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:flutter/services.dart';
import 'package:meonghae_front/config/app_binding.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/fcm_setting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  KakaoSdk.init(nativeAppKey: dotenv.env['KAKAO_NATIVE_KEY']);
  await initializeDateFormatting();
  String? firebaseToken = await fcmSetting();
  // ignore: avoid_print
  print(firebaseToken);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'GmarketSans'),
      debugShowCheckedModeBanner: false,
      locale: const Locale('ko', 'KR'),
      title: 'Meonghae',
      initialBinding: AppBinding(),
      getPages: AppRoutes.pages,
      initialRoute: AppRoutes.initLoading,
    );
  }
}
