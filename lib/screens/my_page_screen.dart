import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/my_page_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/my_page_screen/menu_buttons_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.brown1,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.06,
                          vertical: 20,
                        ),
                        child: const SizedBox(
                            width: 24,
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    ArrowSVG(strokeColor: CustomColor.black2))),
                      ),
                    ),
                    const Text(
                      '마이페이지',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.black2),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06,
                        vertical: 20,
                      ),
                      child: const SizedBox(width: 24),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                BannerWidget(),
                SizedBox(height: 8),
                MenuButtonsWidget(),
              ],
            ),
            UnderBarWidget(currentScreen: '홈마이'),
          ],
        ));
  }
}
