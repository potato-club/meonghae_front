import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_screen/review_menu_buttons_widget.dart';
import 'package:meonghae_front/widgets/review_screen/search_bar_widget.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(
            height: 42,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: const SearchBarWidget(),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: const ReviewMenuButtonsWidget())),
          const UnderBarWidget(currentScreen: '리뷰')
        ],
      )),
    );
  }
}
