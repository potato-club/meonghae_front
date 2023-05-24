import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/calendar_screen.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/screens/post_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
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
                    label: '캘린더',
                    iconName: 'calendar',
                    routePath: const CalendarScreen(),
                    currentScreen: currentScreen,
                  ),
                  UnderBarIconButtonWidget(
                    label: '게시물',
                    iconName: 'post',
                    routePath: const PostScreen(),
                    currentScreen: currentScreen,
                  ),
                  UnderBarIconButtonWidget(
                    label: '홈',
                    iconName: 'home',
                    routePath: const MainScreen(),
                    currentScreen: currentScreen,
                  ),
                  UnderBarIconButtonWidget(
                    label: '리뷰',
                    iconName: 'review',
                    currentScreen: currentScreen,
                  ),
                  UnderBarIconButtonWidget(
                    label: '문의',
                    iconName: 'ask',
                    currentScreen: currentScreen,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
