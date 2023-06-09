import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/additional_info_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/filter_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/top_menu_bar_widget.dart';

class CalendarInfoScreen extends StatefulWidget {
  const CalendarInfoScreen({super.key});

  @override
  State<CalendarInfoScreen> createState() => _CalendarInfoScreenState();
}

class _CalendarInfoScreenState extends State<CalendarInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivory2,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            const TopMenuBarWidget(),
            const SizedBox(height: 4),
            Expanded(
              child: Stack(children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 44,
                        ),
                        FilterWidget(),
                        SizedBox(
                          height: 24,
                        ),
                        AdditionalInfoWidget(),
                        SizedBox(
                          height: 60,
                        )
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
                    height: 36,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
