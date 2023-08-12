import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/select_screen/select_button_widget.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.brown1,
      body: SafeArea(
        child: Container(
          color: CustomColor.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 62,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.07),
                      const Text(
                        "키우시는 강아지나\n고양이가 있으신가요?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            height: 1.3),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.095),
                        child: Image(
                          image: const AssetImage(
                              'assets/images/dog_pictures/drunk_dog.png'),
                          width: MediaQuery.of(context).size.width * 0.6,
                        ),
                      ),
                      Transform.translate(
                          offset: const Offset(0, -18),
                          child: const Text(
                            '술 취한 개는 안된다멍...',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: CustomColor.black3,
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              Flexible(
                flex: 37,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    const SelectButtonWidget(
                        hasAnimal: true, content: "키우는 강아지/고양이가 있어요!"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    const SelectButtonWidget(
                        hasAnimal: false, content: "나만 강아지/고양이 없어..."),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
