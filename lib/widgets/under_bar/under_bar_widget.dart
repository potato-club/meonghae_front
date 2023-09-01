import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
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
                color: CustomColor.black1.withOpacity(0.2),
                offset: const Offset(0, 8),
                blurRadius: 20,
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
                      iconSVG:
                          CalendarSVG(isCurrent: currentScreen.contains('캘린더')),
                      onClick: () {
                        if (currentScreen != '캘린더') {
                          Get.offNamed(AppRoutes.calendar);
                          Get.find<CalendarController>().clear();
                        }
                      },
                      currentScreen: currentScreen,
                      label: '캘린더'),
                  UnderBarIconButtonWidget(
                      iconSVG:
                          PostSVG(isCurrent: currentScreen.contains('게시물')),
                      onClick: () => {
                            if (currentScreen != '게시물')
                              Get.offNamed(AppRoutes.post)
                          },
                      currentScreen: currentScreen,
                      label: '게시물'),
                  UnderBarIconButtonWidget(
                      iconSVG: HomeSVG(isCurrent: currentScreen.contains('홈')),
                      onClick: () => {
                            if (currentScreen != '홈')
                              Get.offNamed(AppRoutes.main)
                          },
                      currentScreen: currentScreen,
                      label: '홈'),
                  UnderBarIconButtonWidget(
                      iconSVG:
                          ReviewSVG(isCurrent: currentScreen.contains('리뷰')),
                      onClick: () => {
                            if (currentScreen != '리뷰')
                              Get.offNamed(AppRoutes.reviewMenu)
                          },
                      currentScreen: currentScreen,
                      label: '리뷰'),
                  UnderBarIconButtonWidget(
                      iconSVG: AskSVG(isCurrent: currentScreen.contains('문의')),
                      onClick: () => {
                            if (currentScreen != '문의')
                              Get.offNamed(AppRoutes.inquiry)
                          },
                      currentScreen: currentScreen,
                      label: '문의')
                ],
              ),
            )
          ],
        ));
  }
}
