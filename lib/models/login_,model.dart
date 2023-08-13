import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/login/social_login.dart';
import 'package:meonghae_front/login/token.dart';

class LoginModel {
  final SocialLogin socialLogin;
  bool isLogined = false;
  User? user;

  LoginModel({
    required this.socialLogin,
  });

  static Future<String> getMobileId() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String id = '';
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidData =
            await deviceInfoPlugin.androidInfo;
        id = androidData.androidId;
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosData = await deviceInfoPlugin.iosInfo;
        id = iosData.identifierForVendor;
      }
    } on PlatformException {
      id = '';
    }
    return id;
  }

  Future<Map<String, dynamic>> login() async {
    isLogined = await socialLogin.login();
    final String mobileId = await getMobileId();
    var fcmToken = await FirebaseMessaging.instance.getToken(
        vapidKey:
            "BJw5iH7_tounnU7fXc_QPkzm1Rh_yIa6xxOkNDw5sWAwlGKPRcd2ojVHsJwhLvQDH9hS3nQ3f-XQDTpdP0dp8gs");
    print(fcmToken);
    if (isLogined) {
      try {
        user = await UserApi.instance.me();
        Dio dio = Dio(BaseOptions(
          baseUrl: 'https://api.meonghae.site/',
          headers: {'androidId': mobileId, 'FCMToken': fcmToken},
        ));
        final response = await dio.get(
          '/user-service/login',
          queryParameters: {'email': user!.kakaoAccount!.email},
        );
        if (response.data['responseCode'] == "200_OK") {
          saveAccessToken(response.headers['authorization']![0]);
          saveRefreshToken(response.headers['refreshtoken']![0]);
        }
        return {'success': true, 'response': response.data};
      } on DioException catch (error) {
        if (error.response?.data['errorCode'] == 'Already Withdrawal') {
          Get.find<UserController>()
              .cancelWidthdrawal(user!.kakaoAccount!.email!);
          try {
            user = await UserApi.instance.me();
            Dio dio = Dio(BaseOptions(
              baseUrl: 'https://api.meonghae.site/',
              headers: {'androidId': mobileId},
            ));
            final response = await dio.get(
              '/user-service/login',
              queryParameters: {'email': user!.kakaoAccount!.email},
            );
            if (response.data['responseCode'] == "200_OK") {
              saveAccessToken(response.headers['authorization']![0]);
              saveRefreshToken(response.headers['refreshtoken']![0]);
            }
            return {'success': true, 'response': response.data};
          } catch (error) {
            return {'success': false, 'error': '로그인에 실패하였어요'};
          }
        } else {
          return {'success': false, 'error': '허가되지 않은 계정이에요'};
        }
      }
    } else {
      return {'success': false, 'error': '로그인에 실패하였어요'};
    }
  }

  Future logout() async {
    await socialLogin.logout();
    isLogined = false;
    user = null;
  }

  Future hasToken() async {
    if (await AuthApi.instance.hasToken()) {
      try {
        AccessTokenInfo tokenInfo = await UserApi.instance.accessTokenInfo();
        return "${tokenInfo.id},${tokenInfo.expiresIn}";
      } catch (error) {
        if (error is KakaoException && error.isInvalidTokenError()) {
          return error;
        } else {
          return error;
        }
      }
    }
  }
}
