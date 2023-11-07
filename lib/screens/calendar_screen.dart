import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_screen/calendar_widget.dart';
import 'package:meonghae_front/widgets/calendar_screen/info_content_widget.dart';
import 'package:meonghae_front/widgets/svg/plus.dart';
import 'package:meonghae_front/widgets/svg/search.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 36,
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.03,
            ),
            child: CalendarWidget(),
          ),
          Positioned(
            top: 58,
            right: MediaQuery.of(context).size.width * 0.03 + 56,
            child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.calendarSearch),
                child: const SearchSVG(strokeColor: CustomColor.black2)),
          ),
          Positioned(
            top: 58,
            right: MediaQuery.of(context).size.width * 0.03 + 16,
            child: GestureDetector(
                onTap: () => Get.toNamed(AppRoutes.calendarInfo),
                child: const PlusSVG(color: CustomColor.black2)),
          ),
          const Positioned(
            bottom: 72,
            child: InfoContentWidget(),
          ),
          const Positioned(
            bottom: 0,
            child: UnderBarWidget(currentScreen: '캘린더'),
          ),
        ],
      ),
    );
  }
}
