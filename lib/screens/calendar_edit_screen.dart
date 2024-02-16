import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/controllers/calendar_edit_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/calendar_edit_screen/additional_info_widget.dart';
import 'package:meonghae_front/widgets/calendar_edit_screen/dog_select_widget.dart';
import 'package:meonghae_front/widgets/calendar_edit_screen/edit_buttons_widget.dart';
import 'package:meonghae_front/widgets/calendar_edit_screen/filter_widget.dart';
import 'package:meonghae_front/widgets/calendar_edit_screen/top_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';

class CalendarEditScreen extends StatefulWidget {
  const CalendarEditScreen({super.key});

  @override
  State<CalendarEditScreen> createState() => _CalendarEditScreenState();
}

class _CalendarEditScreenState extends State<CalendarEditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivory2,
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 126),
              const DogSelectWidget(),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: const FilterWidget(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: const AdditionalInfoWidget(),
              ),
              const SizedBox(height: 120)
            ],
          ),
        ),
        Positioned(
            top: 0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: CustomColor.ivory2,
                child: const TopMenuBarWidget())),
        Positioned(
            bottom: 30,
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: const EditButtonsWidget())),
        GetX<CalendarEditController>(builder: (controller) {
          return Visibility(
            visible: controller.isLoading.value,
            child: const Positioned(
                child: Center(
              child: LoadingDotWidget(color: CustomColor.black2),
            )),
          );
        }),
      ]),
    );
  }
}
