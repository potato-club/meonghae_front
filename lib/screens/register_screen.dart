import 'package:flutter/material.dart';
import 'package:meonghae_front/widgets/register_screen/registerImage_widget.dart';

import '../widgets/register_screen/registerForm_widget.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Flexible(
                flex: 35,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    SizedBox(height: 130)
                  ],
                ),
              ),
              Flexible(
                flex: 65,
                child: Container(
                  padding: const EdgeInsets.only(top: 100),
                  width: 850,
                  height: 820,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2CB80),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.5, 74),
                        topRight: Radius.elliptical(
                            MediaQuery.of(context).size.width * 0.5, 74)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.1),
                    child: const RegisterForm(),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * 0.35 - 80,
              child: const RegisterImage()),
        ],
      ),
    );
  }
}
