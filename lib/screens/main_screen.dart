import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/widgets/main_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_widget.dart';
import 'package:meonghae_front/widgets/main_screen/my_dog_scroll_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Transform.translate(
                        offset: const Offset(0, 8),
                        child: const Image(
                          image: AssetImage(
                              'assets/images/logo/meonghae_logo.png'),
                          width: 68,
                          height: 46,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 24, bottom: 32),
                        child: BannerWidget(),
                      )
                    ])),
            GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.mypageDog),
                child: const MyDogScrollWidget()),
          ],
        ),
      ),
      const Positioned(
        bottom: 0,
        child: MainContentWidget(),
      ),
    ]);
  }
}
