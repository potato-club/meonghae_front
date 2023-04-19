import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/widgets/register_screen/register_init_form.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  List<Widget> registerSliders = [];

  @override
  void initState() {
    super.initState();
    registerSliders = [
      RegisterInitForm(
        onAddRegisterInitForm: addSliderItem,
      ),
    ];
  }

  void addSliderItem() {
    setState(() {
      registerSliders.add(RegisterInitForm(
        onAddRegisterInitForm: addSliderItem,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35 - 130,
            child: const Column(
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
              ],
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.65 + 130,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
            ),
            items: registerSliders,
          )
        ]));
  }
}
