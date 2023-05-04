import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/login_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/select_screen/select_button_widget.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Flexible(
            flex: 55,
            child: Container(
              decoration: BoxDecoration(
                color: CustomColor.brown1,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.elliptical(
                        MediaQuery.of(context).size.width * 0.5, 74),
                    bottomRight: Radius.elliptical(
                        MediaQuery.of(context).size.width * 0.5, 74)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "키우시는 강아지나",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Text(
                    "고양이가 있으신가요?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.04,
                    ),
                    child: Image(
                      image: const AssetImage(
                          'assets/images/dog_pictures/drunk_dog.png'),
                      width: MediaQuery.of(context).size.width * 0.6,
                    ),
                  ),
                  Transform.translate(
                      offset: const Offset(0, -20),
                      child: const Text(
                        '술 취한 개는 안된다멍...',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ))
                ],
              ),
            ),
          ),
          const Flexible(
            flex: 45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectButtonWidget(
                  content: "키우는 강아지/고양이가 있어요!",
                  routingWidget: LoginScreen(),
                ),
                SizedBox(height: 40),
                SelectButtonWidget(
                  content: "나만 강아지/고양이 없어...",
                  routingWidget: SelectScreen(),
                ),
                SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
