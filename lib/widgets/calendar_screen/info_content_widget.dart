import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/calendar_screen/info_item_widget.dart';
import 'package:meonghae_front/widgets/calendar_screen/no_info_widget.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';

class InfoContentWidget extends StatefulWidget {
  const InfoContentWidget({super.key});

  @override
  State<InfoContentWidget> createState() => _InfoContentWidgetState();
}

class _InfoContentWidgetState extends State<InfoContentWidget> {
  List<String> dayOfWeek = ["월", "화", "수", "목", "금", "토", "일"];
  double _containerHeight = 0;
  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (details.delta.dy > -0.9) {
        _containerHeight = 0;
      } else {
        _containerHeight = 200;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        height: MediaQuery.of(context).size.height - 560 + _containerHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
                color: CustomColor.black1.withOpacity(0.12),
                offset: const Offset(0, -4),
                blurRadius: 12,
                spreadRadius: 0)
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: CustomColor.lightGray1,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              GetX<CalendarController>(builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.06),
                      child: Text(
                        "${controller.selectedDay.value.day}일 ${dayOfWeek[controller.selectedDay.value.weekday - 1]}요일",
                        style: const TextStyle(
                          fontSize: 15,
                          color: CustomColor.brown1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    controller.isLoading.value
                        ? SizedBox(
                            height: MediaQuery.of(context).size.height -
                                630 +
                                _containerHeight,
                            child: const Center(
                                child: LoadingDotWidget(
                              color: CustomColor.brown1,
                              size: 28,
                            )),
                          )
                        : controller.dayEvents.isEmpty
                            ? const NoInfoWidget()
                            : SizedBox(
                                height: MediaQuery.of(context).size.height -
                                    630 +
                                    _containerHeight,
                                child: _containerHeight == 0
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.06),
                                        child: Card(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 6),
                                          elevation: 0,
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.zero,
                                          ),
                                          clipBehavior: Clip.none,
                                          child: Wrap(
                                            children: [
                                              for (var i = 0;
                                                  i <
                                                      controller
                                                          .dayEvents.length;
                                                  i++)
                                                InfoItemWidget(
                                                  data: controller.dayEvents[i],
                                                  isEnd: i + 1 ==
                                                      controller
                                                          .dayEvents.length,
                                                ),
                                            ],
                                          ),
                                        ),
                                      )
                                    : Stack(children: [
                                        SingleChildScrollView(
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4,
                                                horizontal:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        0.06),
                                            child: Card(
                                              elevation: 0,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 6),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.zero,
                                              ),
                                              clipBehavior: Clip.none,
                                              child: Wrap(
                                                children: [
                                                  for (var i = 0;
                                                      i <
                                                          controller
                                                              .dayEvents.length;
                                                      i++)
                                                    InfoItemWidget(
                                                      data: controller
                                                          .dayEvents[i],
                                                      isEnd: i + 1 ==
                                                          controller
                                                              .dayEvents.length,
                                                    )
                                                ],
                                              ),
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
                                                  CustomColor.white,
                                                  CustomColor.white
                                                      .withOpacity(0),
                                                ])),
                                            height: 18,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                          ),
                                        ),
                                      ]),
                              ),
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
