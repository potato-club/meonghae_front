import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/additional_info_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/dog_select_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/filter_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/top_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';

class CalendarInfoScreen extends StatefulWidget {
  const CalendarInfoScreen({super.key});

  @override
  State<CalendarInfoScreen> createState() => _CalendarInfoScreenState();
}

class _CalendarInfoScreenState extends State<CalendarInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<CalendarController>().willPop();
        return true;
      },
      child: Scaffold(
        backgroundColor: CustomColor.ivory2,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 120),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06),
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColor.white,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("애완동물 선택",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.black2))),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: DogSelectWidget(),
                ),
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
                const SizedBox(height: 60)
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
          GetX<CalendarController>(builder: (controller) {
            return Visibility(
              visible: controller.isSending.value,
              child: const Positioned(
                  child: Center(
                child: LoadingDotWidget(color: CustomColor.black2),
              )),
            );
          }),
        ]),
      ),
    );
  }
}
