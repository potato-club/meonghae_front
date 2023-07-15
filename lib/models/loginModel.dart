import 'package:dio/dio.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:meonghae_front/login/social_login.dart';
import 'package:meonghae_front/login/token.dart';

class LoginModel {
  final SocialLogin socialLogin;
  bool isLogined = false;
  User? user;

  LoginModel({
    required this.socialLogin,
  });

  Future<Map<String, dynamic>> login() async {
    isLogined = await socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
      Dio dio = Dio(BaseOptions(
        baseUrl: 'https://api.meonghae.site/',
        // headers: {'AndroidId': getDeviceUniqueId()},
      ));
      final response = await dio.get(
        '/user-service/login',
        queryParameters: {'email': user!.kakaoAccount!.email},
      );
      if (response.statusCode == 200) {
        if (response.data['responseCode'] == "200_OK") {
          saveAccessToken(response.headers['authorization']![0]);
          saveRefreshToken(response.headers['refreshtoken']![0]);
        }
        return {'success': true, 'response': response.data};
      } else {
        return {'success': false, 'error': '유저정보 확인에 실패하였습니다'};
      }
    } else {
      return {'success': false, 'error': '로그인에 실패하였습니다'};
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
