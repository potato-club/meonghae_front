import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_search_screen/search_item_widget.dart';
import 'package:meonghae_front/widgets/calendar_search_screen/top_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class CalendarSearchScreen extends StatefulWidget {
  const CalendarSearchScreen({super.key});

  @override
  State<CalendarSearchScreen> createState() => _CalendarSearchScreenState();
}

class _CalendarSearchScreenState extends State<CalendarSearchScreen> {
  List searchResult = [];
  void setSearchResult(List data) async {
    setState(() => searchResult = data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.ivory2,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32),
              TopMenuBarWidget(setSearchResult: setSearchResult),
              const SizedBox(height: 10),
              Expanded(
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 20),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SearchItemWidget(),
                            SizedBox(height: 24),
                          ],
                        ),
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
