import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/controllers/home_controller.dart';
import 'package:meonghae_front/screens/calendar_screen.dart';
import 'package:meonghae_front/screens/inquiry_screen.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/screens/post_screen.dart';
import 'package:meonghae_front/screens/review_menu_screen.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/under_bar/ask.dart';
import 'package:meonghae_front/widgets/svg/under_bar/calendar.dart';
import 'package:meonghae_front/widgets/svg/under_bar/home.dart';
import 'package:meonghae_front/widgets/svg/under_bar/post.dart';
import 'package:meonghae_front/widgets/svg/under_bar/review.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late DateTime _lastPressedAt;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: PageView(
            controller: Get.find<HomeController>().pageController.value,
            children: const [
              CalendarScreen(),
              PostScreen(),
              MainScreen(),
              ReviewMenuScreen(),
              InquiryScreen()
            ],
            onPageChanged: (index) {
              Get.find<HomeController>().currentPage.value = index;
            },
          ),
        ),
        bottomNavigationBar: Container(
            height: 74,
            decoration: BoxDecoration(
              color: CustomColor.white,
              boxShadow: [
                BoxShadow(
                    color: CustomColor.black1.withOpacity(0.2),
                    offset: const Offset(0, 8),
                    blurRadius: 20,
                    spreadRadius: 0)
              ],
            ),
            child: GetX<HomeController>(builder: (controller) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UnderBarIconButtonWidget(
                        iconSVG: CalendarSVG(
                            isCurrent: controller.currentPage.value == 0),
                        onClick: () {
                          Get.find<CalendarController>().clear();
                          controller.navigateToPage(0);
                        },
                        isActive: controller.currentPage.value == 0,
                        label: '캘린더'),
                    UnderBarIconButtonWidget(
                        iconSVG: PostSVG(
                            isCurrent: controller.currentPage.value == 1),
                        onClick: () {
                          controller.navigateToPage(1);
                        },
                        isActive: controller.currentPage.value == 1,
                        label: '게시글'),
                    UnderBarIconButtonWidget(
                        iconSVG: HomeSVG(
                            isCurrent: controller.currentPage.value == 2),
                        onClick: () {
                          controller.navigateToPage(2);
                        },
                        isActive: controller.currentPage.value == 2,
                        label: '홈'),
                    UnderBarIconButtonWidget(
                        iconSVG: ReviewSVG(
                            isCurrent: controller.currentPage.value == 3),
                        onClick: () {
                          controller.navigateToPage(3);
                        },
                        isActive: controller.currentPage.value == 3,
                        label: '리뷰'),
                    UnderBarIconButtonWidget(
                        iconSVG: AskSVG(
                            isCurrent: controller.currentPage.value == 4),
                        onClick: () {
                          controller.navigateToPage(4);
                        },
                        isActive: controller.currentPage.value == 4,
                        label: '문의')
                  ]);
            })));
  }
}
