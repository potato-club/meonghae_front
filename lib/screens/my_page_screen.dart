import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/my_page_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/my_page_screen/menu_buttons_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.ivory2,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06,
                            vertical: 20,
                          ),
                          child: const SizedBox(
                              width: 24,
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: ArrowSVG(
                                      strokeColor: CustomColor.black2))),
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height * 0.022, 0, 8),
                    child: const BannerWidget(),
                  ),
                  const MenuButtonsWidget(),
                ],
              ),
            ],
          ),
        ));
  }
}
