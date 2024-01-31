import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:meonghae_front/login/social_login.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();
      if (isInstalled) {
        try {
          OAuthToken tokenResponse =
              await UserApi.instance.loginWithKakaoTalk();
          TokenManagerProvider.instance.manager.setToken(tokenResponse);
          return true;
        } catch (err) {
          SnackBarWidget.show(SnackBarType.error, '4#.$err');
          return false;
        }
      } else {
        try {
          OAuthToken tokenResponse =
              await UserApi.instance.loginWithKakaoAccount();
          TokenManagerProvider.instance.manager.setToken(tokenResponse);
          return true;
        } catch (err) {
          return false;
        }
      }
    } catch (err) {
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
