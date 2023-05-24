import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/calendar_screen.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/ask.dart';
import 'package:meonghae_front/widgets/svg/calendar.dart';
import 'package:meonghae_front/widgets/svg/home.dart';
import 'package:meonghae_front/widgets/svg/post.dart';
import 'package:meonghae_front/widgets/svg/review.dart';
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
                    isCurrent: '캘린더' == currentScreen,
                  ),
                  UnderBarIconButtonWidget(
                      iconSVG: PostSVG(isCurrent: '게시물' == currentScreen),
                      routePath: const CalendarScreen(),
                      isCurrent: '게시물' == currentScreen),
                  UnderBarIconButtonWidget(
                      iconSVG: HomeSVG(isCurrent: '홈' == currentScreen),
                      routePath: const MainScreen(),
                      isCurrent: '홈' == currentScreen),
                  UnderBarIconButtonWidget(
                      iconSVG: ReviewSVG(isCurrent: '리뷰' == currentScreen),
                      routePath: const CalendarScreen(),
                      isCurrent: '리뷰' == currentScreen),
                  UnderBarIconButtonWidget(
                      iconSVG: AskSVG(isCurrent: '문의' == currentScreen),
                      routePath: const CalendarScreen(),
                      isCurrent: '문의' == currentScreen)
                ],
              ),
            )
          ],
        ));
  }
}
