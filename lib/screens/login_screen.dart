import 'package:flutter/material.dart';
import 'package:meonghae_front/login/kakao_login.dart';
import 'package:meonghae_front/models/loginModel.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/login_screen/dog_picture_swiper.dart';
import 'package:meonghae_front/widgets/login_screen/kakao_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final kakaoModel = LoginModel(socialLogin: KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColor.brown1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
              flex: 35,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Transform.translate(
                      offset: const Offset(0, 32),
                      child: const DogPictureSwiper()),
                ],
              ),
            ),
            Flexible(
              flex: 65,
              child: Container(
                decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(
                          MediaQuery.of(context).size.width * 0.5, 74),
                      topRight: Radius.elliptical(
                          MediaQuery.of(context).size.width * 0.5, 74)),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, -12), // 그림자의 위치
                      blurRadius: 20, // 그림자의 흐림 정도
                      color: CustomColor.brown2, // 그림자의 색상
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '멍해',
                          style: TextStyle(
                            color: CustomColor.black1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text('로',
                            style: TextStyle(
                              color: CustomColor.black1,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      '간편하게 애완동물의',
                      style: TextStyle(
                        color: CustomColor.black1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '스케줄을 관리해 보세요!',
                      style: TextStyle(
                        color: CustomColor.black1,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.178),
                    KakaoButton(
                      loginModel: kakaoModel,
                    ),
                    const SizedBox(height: 20),
                    const SizedBox(height: 16)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
