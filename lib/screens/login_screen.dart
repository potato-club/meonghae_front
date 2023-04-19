import 'package:flutter/material.dart';
import 'package:meonghae_front/login/kakao_login.dart';
import 'package:meonghae_front/models/loginModel.dart';
import 'package:meonghae_front/widgets/kakao_widget.dart';

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 84),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    top: 0,
                    child: Text(
                      '주인아, 멍해?',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/dog_pictures/stand_dog.png',
                          width: 225,
                          height: 210,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: Container(
                      padding: const EdgeInsets.only(top: 110),
                      width: 850,
                      height: 820,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, -12), // 그림자의 위치
                            blurRadius: 20, // 그림자의 흐림 정도
                            color: Color(0xffDEB567), // 그림자의 색상
                          ),
                        ],
                        color: const Color(0xffFFFCF4),
                        borderRadius: BorderRadius.circular(900),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Text(
                                '멍해로',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
