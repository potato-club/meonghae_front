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
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';

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

  Future<Map<String, dynamic>> reLogin(
      Dio dio, String mobileId, String? fcmToken) async {
    try {
      user = await UserApi.instance.me();
      final response = await dio.get('/user-service/login',
          queryParameters: {'email': user!.kakaoAccount!.email},
          options:
              Options(headers: {'androidId': mobileId, 'FCMToken': fcmToken}));
      if (response.data['responseCode'] == "200_OK") {
        saveAccessToken(response.headers['authorization']![0]);
        saveRefreshToken(response.headers['refreshtoken']![0]);
      }
      return {'success': true, 'response': response.data};
    } on DioException catch (error) {
      return {'success': false, 'error': '로그인에 실패하였어요'};
    }
  }

  Future<Map<String, dynamic>> login() async {
    isLogined = await socialLogin.login();
    Dio dio = Dio(BaseOptions(baseUrl: 'https://api.meonghae.site/'));
    final String mobileId = await getMobileId();
    print(mobileId);
    var fcmToken = await FirebaseMessaging.instance.getToken(
        vapidKey:
            "BJw5iH7_tounnU7fXc_QPkzm1Rh_yIa6xxOkNDw5sWAwlGKPRcd2ojVHsJwhLvQDH9hS3nQ3f-XQDTpdP0dp8gs");
    if (isLogined) {
      try {
        user = await UserApi.instance.me();
        final response = await dio.get('/user-service/login',
            queryParameters: {'email': user!.kakaoAccount!.email},
            options: Options(
                headers: {'androidId': mobileId, 'FCMToken': fcmToken}));
        if (response.data['responseCode'] == "200_OK") {
          saveAccessToken(response.headers['authorization']![0]);
          saveRefreshToken(response.headers['refreshtoken']![0]);
        }
        return {'success': true, 'response': response.data};
      } on DioException catch (error) {
        if (error.response?.data['errorCode'] == 'Already Withdrawal') {
          bool isCancelWithdrawal = false;
          CustomWarningModalWidget.show('회원탈퇴 신청 계정이에요',
              '탈퇴 신청일로부터 7일간 탈퇴 신청을 취소할 수 있어요\n회워탈퇴 신청을 취소하시겠어요?', () {
            Get.find<UserController>()
                .cancelWidthdrawal(user!.kakaoAccount!.email!);
            isCancelWithdrawal = true;
          });
          if (isCancelWithdrawal) {
            return reLogin(dio, mobileId, fcmToken);
          } else {
            return {'success': null};
          }
        } else {
          return reLogin(dio, mobileId, fcmToken);
        }
      }
    } else {
      return {'success': false, 'error': '카카오 인증에 실패하였어요'};
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
