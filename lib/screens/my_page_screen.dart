import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/storages//user/user_info.dart';
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
  String name = '멍해';
  String? image;

  @override
  void initState() {
    readUserInfo();
    super.initState();
  }

  Future<void> readUserInfo() async {
    var userName = await readUserNickname();
    var userFileUrl = await readUserFileUrl();
    setState(() {
      name = userName;
      image = userFileUrl.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.brown1,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ),
                      ),
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
                BannerWidget(image: image, name: name),
                SizedBox(height: 8),
                MenuButtonsWidget(readUserInfo: readUserInfo),
              ],
            ),
            UnderBarWidget(currentScreen: '홈마이'),
          ],
        ));
  }
}
