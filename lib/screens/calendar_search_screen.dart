import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_search_screen/search_item_widget.dart';
import 'package:meonghae_front/widgets/calendar_search_screen/top_menu_bar_widget.dart';

class CalendarSearchScreen extends StatefulWidget {
  const CalendarSearchScreen({super.key});

  @override
  State<CalendarSearchScreen> createState() => _CalendarSearchScreenState();
}

class _CalendarSearchScreenState extends State<CalendarSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.ivory2,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32),
              const TopMenuBarWidget(),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06),
                        child: GetX<CalendarController>(builder: (controller) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 20),
                              ...controller.searchEvents.map((element) =>
                                  SearchItemWidget(eventDetail: element)),
                              const SizedBox(height: 24),
                            ],
                          );
                        }),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              CustomColor.ivory2,
                              CustomColor.ivory2.withOpacity(0),
                            ])),
                        height: 20,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
