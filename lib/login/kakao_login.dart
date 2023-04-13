import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:meonghae_front/login/social_login.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          return true;
        } catch (err) {
          print(err);
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          return true;
        } catch (err) {
          print('kakaoLogin: $err');
          return false;
        }
      }
    } catch (err) {
      print(err);
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      return true;
    } catch (err) {
      return false;
    }
  }
}
