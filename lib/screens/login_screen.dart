import 'package:flutter/material.dart';
import 'package:meonghae_front/login/kakao_login.dart';
import 'package:meonghae_front/models/loginModel.dart';
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
        color: const Color(0xffF2CB80),
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
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.elliptical(
                          MediaQuery.of(context).size.width * 0.5, 74),
                      topRight: Radius.elliptical(
                          MediaQuery.of(context).size.width * 0.5, 74)),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, -12), // 그림자의 위치
                      blurRadius: 20, // 그림자의 흐림 정도
                      color: Color(0xffDEB567), // 그림자의 색상
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          '멍해',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          '로',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '${kakaoModel.isLogined}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      '간편하게 애완동물의',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Text(
                      '스케줄을 관리해 보세요.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    KakaoButton(
                      loginModel: kakaoModel,
                    ),
                    const SizedBox(height: 20),
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
