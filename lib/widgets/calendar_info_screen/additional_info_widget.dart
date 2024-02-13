import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/cycle_count_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/dial_box_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/swich_widget.dart';
import 'package:meonghae_front/widgets/common/dial_input_widget.dart';

class AdditionalInfoWidget extends StatefulWidget {
  const AdditionalInfoWidget({super.key});

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(builder: (controller) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 75,
                    child: Text(
                      '일정일',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2,
                      ),
                    ),
                  ),
                  DialBoxWidget(
                    label: DateFormat('yyyy. MM. dd')
                        .format(controller.calendarForm.value.scheduleTime),
                    onSave: (DateTime dateTime) {
                      controller.calendarForm.value.scheduleTime = dateTime;
                      controller.calendarForm.update((val) {});
                    },
                    dialType: DialType.date,
                    scheduleTime: controller.calendarForm.value.scheduleTime,
                    textAlign: TextAlign.center,
                  ),
                  DialBoxWidget(
                    label: DateFormat('a hh:mm', 'ko')
                        .format(controller.calendarForm.value.scheduleTime),
                    onSave: (DateTime dateTime) {
                      controller.calendarForm.value.scheduleTime = dateTime;
                      controller.calendarForm.update((val) {});
                    },
                    dialType: DialType.time,
                    scheduleTime: controller.calendarForm.value.scheduleTime,
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            height: controller.calendarForm.value.hasRepeat ? 90 : 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.white,
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '반복',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2,
                          ),
                        ),
                        SwitchWidget(
                          clickSwitch: () {
                            controller.calendarForm.value.hasRepeat =
                                !controller.calendarForm.value.hasRepeat;
                            controller.calendarForm.update((val) {});
                          },
                          isChecked: controller.calendarForm.value.hasRepeat,
                        ),
                      ],
                    ),
                  ),
                ),
                if (controller.calendarForm.value.hasRepeat)
                  Container(
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(
                                width: 1, color: CustomColor.ivory2))),
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 9,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('반복 설정',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.black2,
                                )),
                            const CycleCountWidget(),
                            DialInputWidget(
                              width: 75,
                              height: 30,
                              itemHeight: 30,
                              list: controller.cycleList.keys.toList(),
                              listHeight: 90,
                              fontSize: 13,
                              color: CustomColor.gray,
                              bgColor: CustomColor.white,
                              strColor: CustomColor.ivory2,
                              defaultValue: controller.cycleList.keys
                                  .firstWhere((key) =>
                                      controller.cycleList[key] ==
                                      controller.calendarForm.value.cycleCount),
                              setValue: (String value) {
                                controller.calendarForm.value.cycleCount =
                                    controller.cycleList[value]!;
                                controller.calendarForm.update((val) {});
                              },
                            ),
                          ]),
                    ),
                  ),
              ]),
            ),
          ),
          const SizedBox(height: 24),
          AnimatedContainer(
            clipBehavior: Clip.hardEdge,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
            height: controller.calendarForm.value.hasAlarm ? 90 : 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColor.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 45,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            '알림',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.black2,
                            ),
                          ),
                          SwitchWidget(
                            clickSwitch: () {
                              controller.calendarForm.value.hasAlarm =
                                  !controller.calendarForm.value.hasAlarm;
                              controller.calendarForm.update((val) {});
                            },
                            isChecked: controller.calendarForm.value.hasAlarm,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.calendarForm.value.hasAlarm)
                    Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: CustomColor.ivory2))),
                      height: 45,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                              width: 75,
                              child: Text(
                                '알림 설정',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.black2,
                                ),
                              ),
                            ),
                            DialInputWidget(
                              width: 75,
                              height: 30,
                              itemHeight: 30,
                              list: controller.alarmList.keys.toList(),
                              listHeight: 150,
                              fontSize: 13,
                              color: CustomColor.gray,
                              bgColor: CustomColor.white,
                              strColor: CustomColor.ivory2,
                              defaultValue: controller.alarmList.keys
                                  .firstWhere((key) =>
                                      controller.alarmList[key] ==
                                      controller.calendarForm.value.alarmDate),
                              setValue: (String index) {
                                controller.calendarForm.value.alarmDate =
                                    controller.alarmList[index]!;
                                controller.calendarForm.update((val) {});
                              },
                            ),
                            DialBoxWidget(
                              label: DateFormat('a hh:mm', 'ko').format(
                                  controller.calendarForm.value.alarmTime),
                              onSave: (DateTime dateTime) {
                                controller.calendarForm.value.alarmTime =
                                    dateTime;
                                controller.calendarForm.update((val) {});
                              },
                              dialType: DialType.time,
                              scheduleTime:
                                  controller.calendarForm.value.alarmTime,
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Container(
            height: 301,
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '메모',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.black2,
                    ),
                  ),
                  TextField(
                    controller: controller.memoController,
                    style: const TextStyle(
                      color: CustomColor.black2,
                      fontSize: 13,
                    ),
                    maxLines: 20,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(top: 12),
                      hintText: "내용을 입력해주세요",
                      hintStyle:
                          TextStyle(fontSize: 12, color: CustomColor.gray),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
