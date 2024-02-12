import 'dart:convert';
import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/controllers/home_controller.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/login/social_login.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

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

  static void getAppData() {
    Get.find<UserController>().fetchData();
    Get.find<DogController>().fetchData();
    Get.find<PostController>().fetchData();
  }

  Future<void> login() async {
    isLogined = await socialLogin.login();
    if (isLogined) {
      Dio dio = Dio(BaseOptions(baseUrl: dotenv.env['SERVER_URL']!));
      final String mobileId = await getMobileId();
      final fcmToken = await FirebaseMessaging.instance
          .getToken(vapidKey: dotenv.env['FCM_VAPID_KEY']);
      try {
        user = await UserApi.instance.me();
        final response = await dio.get('/user-service/login',
            queryParameters: {'email': user!.kakaoAccount!.email},
            options: Options(
                headers: {'androidId': mobileId, 'FCMToken': fcmToken}));
        if (response.data['responseCode'] == "200_OK") {
          saveAccessToken(response.headers['authorization']![0]);
          saveRefreshToken(response.headers['refreshtoken']![0]);
          Get.offNamed(AppRoutes.introVideo);
        } else if (response.data['responseCode'] == "201_CREATED") {
          Get.find<UserController>().setRegisterEmail(response.data['email']);
          Get.offNamed(AppRoutes.select);
        } else {
          SnackBarWidget(SnackBarType.error, '허가되지 않은 게정이에요');
        }
      } on DioException catch (error) {
        if (error.response?.data['errorCode'] == 'Already Withdrawal') {
          bool isCancelWithdrawal = false;
          CustomWarningModalWidget.show('회원탈퇴 신청 계정이에요',
              '탈퇴 신청일로부터 7일간 탈퇴 신청을 취소할 수 있어요\n회워탈퇴 신청을 취소하시겠어요?', () async {
            isCancelWithdrawal = await Get.find<UserController>()
                .cancelWidthdrawal(user!.kakaoAccount!.email!);
          });
          if (isCancelWithdrawal) {
            return login();
          } else {
            SnackBarWidget(SnackBarType.error, '회원탈퇴에 실패하였어요');
          }
        } else {
          SnackBarWidget(SnackBarType.error, '로그인에 실패하였어요');
        }
      } finally {
        dio.close();
      }
    } else {
      SnackBarWidget(SnackBarType.error, '카카오 인증에 실패하였어요');
    }
  }

  static void logout() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeController>().initPageController();
    });
    deleteAccessToken();
    deleteRefreshToken();
    Get.offAllNamed(AppRoutes.login);
  }

  static Future<void> wasLogined() async {
    if (await readAccessToken() != null) {
      Dio dio = Dio(BaseOptions(baseUrl: dotenv.env['SERVER_URL']!));
      try {
        final response = await dio.get('/check',
            options:
                Options(headers: {'Authorization': await readAccessToken()}));
        if (response.data == true) {
          getAppData();
          Get.offNamed(AppRoutes.home);
        }
      } on DioException catch (error) {
        if (jsonDecode(error.response?.data)['errorCode'] == 4002) {
          var refreshToken = await readRefreshToken();
          var mobileId = await LoginModel.getMobileId();
          final dio = Dio(BaseOptions(
            baseUrl: dotenv.env['SERVER_URL']!,
            headers: {'refreshToken': refreshToken, 'androidId': mobileId},
          ));
          try {
            final response = await dio.get('/user-service/reissue');
            saveAccessToken(response.headers['authorization']![0]);
            saveRefreshToken(response.headers['refreshtoken']![0]);
            getAppData();
            Get.offNamed(AppRoutes.home);
          } catch (error) {
            logout();
          }
        } else {
          logout();
        }
      } finally {
        dio.close();
      }
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}
