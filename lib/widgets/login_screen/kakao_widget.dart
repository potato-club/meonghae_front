import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/models/login_,model.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class KakaoButton extends StatefulWidget {
  final LoginModel loginModel;
  const KakaoButton({
    super.key,
    required this.loginModel,
  });

  @override
  State<KakaoButton> createState() => _KakaoButtonState();
}

class _KakaoButtonState extends State<KakaoButton> {
  void handleLogin() async {
    Map<String, dynamic> result = await widget.loginModel.login();
    if (result['success']) {
      if (result['response']['responseCode'] == "201_CREATED") {
        Get.find<UserController>()
            .setRegisterEmail(result['response']['email']);
        Get.offNamed(AppRoutes.select);
      } else {
        Get.offNamed(AppRoutes.introVideo);
      }
    } else if (!result['success']) {
      var a = await KakaoSdk.origin;
      SnackBarWidget.show(SnackBarType.error, result['error']);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          fixedSize: const Size(270, 49),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: CustomColor.kakao,
        ),
        onPressed: handleLogin,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(
                'assets/images/logo/kakao.png',
                width: 24,
                height: 24,
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: CustomColor.gray.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(1)),
                width: 1,
                height: 30),
            const SizedBox(width: 10),
            const Expanded(
              child: Text(
                '카카오 로그인',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: CustomColor.black2),
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
      ),
    );
  }
}
