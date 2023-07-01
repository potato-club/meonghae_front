import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/calendar_screen.dart';
import 'package:meonghae_front/screens/inquiry_screen.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/screens/post_screen.dart';
import 'package:meonghae_front/screens/review_menu_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/under_bar/ask.dart';
import 'package:meonghae_front/widgets/svg/under_bar/calendar.dart';
import 'package:meonghae_front/widgets/svg/under_bar/home.dart';
import 'package:meonghae_front/widgets/svg/under_bar/post.dart';
import 'package:meonghae_front/widgets/svg/under_bar/review.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_icon_button.dart';

class UnderBarWidget extends StatelessWidget {
  final String currentScreen;

  const UnderBarWidget({super.key, required this.currentScreen});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: CustomColor.black1.withOpacity(0.12),
                offset: const Offset(0, -4),
                blurRadius: 12,
                spreadRadius: 0)
          ],
        ),
        width: MediaQuery.of(context).size.width,
        height: 74,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UnderBarIconButtonWidget(
                      iconSVG: CalendarSVG(isCurrent: '캘린더' == currentScreen),
                      routePath: const CalendarScreen(),
                      currentScreen: currentScreen,
                      label: '캘린더'),
                  UnderBarIconButtonWidget(
                      iconSVG: PostSVG(isCurrent: '게시물' == currentScreen),
                      routePath: const PostScreen(),
                      currentScreen: currentScreen,
                      label: '게시물'),
                  UnderBarIconButtonWidget(
                      iconSVG: HomeSVG(isCurrent: '홈' == currentScreen),
                      routePath: const MainScreen(),
                      currentScreen: currentScreen,
                      label: '홈'),
                  UnderBarIconButtonWidget(
                      iconSVG: ReviewSVG(isCurrent: '리뷰' == currentScreen),
                      routePath: const ReviewMenuScreen(),
                      currentScreen: currentScreen,
                      label: '리뷰'),
                  UnderBarIconButtonWidget(
                      iconSVG: AskSVG(isCurrent: '문의' == currentScreen),
                      routePath: const InquiryScreen(),
                      currentScreen: currentScreen,
                      label: '문의')
                ],
              ),
            )
          ],
        ));
  }
}
