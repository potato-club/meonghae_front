import 'package:flutter/material.dart';
import 'package:meonghae_front/widgets/registerForm_widget.dart';
import 'package:meonghae_front/widgets/registerImage_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xffFFFCF4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 104),
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Positioned(
                    top: 0,
                    child: Column(
                      children: [
                        Text(
                          '내 강아지/고양이',
                          style: TextStyle(
                            color: Color(0xff191919),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          '정보 입력',
                          style: TextStyle(
                            color: Color(0xff191919),
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
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
                        color: const Color(0xffF2CB80),
                        borderRadius: BorderRadius.circular(900),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 270,
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height - 250,
                        child: const RegisterForm()),
                  ),
                  const Positioned(
                    top: 95,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [RegisterImage()],
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
