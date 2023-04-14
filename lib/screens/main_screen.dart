import 'package:flutter/material.dart';
import 'package:meonghae_front/widgets/main_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_widget.dart';
import 'package:meonghae_front/widgets/main_screen/my_dog_scroll_widget.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFCF4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage('assets/images/logo/meonghae_logo.png'),
                  width: 68,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 24, bottom: 32),
                  child: BannerWidget(),
                ),
                MyDogScrollWidget(),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const MainContentWidget(),
          const UnderBarWidget()
        ],
      ),
    );
  }
}
