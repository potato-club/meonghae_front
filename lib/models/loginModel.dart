import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:meonghae_front/login/social_login.dart';

class LoginModel {
  final SocialLogin socialLogin;
  bool isLogined = false;
  User? user;

  LoginModel({
    required this.socialLogin,
  });

  Future login() async {
    isLogined = await socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
    print('isLogined: $isLogined');
  }

  Future logout() async {
    await socialLogin.logout();
    isLogined = false;
    user = null;
  }
}