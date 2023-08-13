import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/dial_box_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/swich_widget.dart';
import 'package:meonghae_front/widgets/common/dial_Input_widget.dart';

class AdditionalInfoWidget extends StatefulWidget {
  const AdditionalInfoWidget({super.key});

  @override
  State<AdditionalInfoWidget> createState() => _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends State<AdditionalInfoWidget> {
  DateTime selectedDate = DateTime.now();

  List<String> alarmDay = [];

  @override
  void initState() {
    for (int i = 0; i < 30; i++) {
      alarmDay.add('${30 - i}일 전');
    }
    alarmDay.add('당일');
    for (int i = 0; i < 30; i++) {
      alarmDay.add('${i + 1}일 후');
    }
    super.initState();
  }

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
                    onSave: (DateTime dateTime) =>
                        controller.calendarForm.value.scheduleTime = dateTime,
                    dialType: DialType.DATE,
                    scheduleTime: controller.calendarForm.value.scheduleTime,
                    textAlign: TextAlign.center,
                  ),
                  DialBoxWidget(
                    label: DateFormat('a hh:mm', 'ko')
                        .format(controller.calendarForm.value.scheduleTime),
                    onSave: (DateTime dateTime) =>
                        controller.calendarForm.value.scheduleTime = dateTime,
                    dialType: DialType.TIME,
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
            height: controller.isAlarm.value ? 91 : 45,
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
                            clickSwitch: () => controller.isAlarm.value =
                                !controller.isAlarm.value,
                            isChecked: controller.isAlarm.value,
                          ),
                        ],
                      ),
                    ),
                  ),
                  if (controller.isAlarm.value)
                    Column(
                      children: [
                        Container(height: 1, color: CustomColor.ivory2),
                        SizedBox(
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
                                  list: alarmDay,
                                  listHeight: 150,
                                  fontSize: 13,
                                  color: CustomColor.gray,
                                  bgColor: CustomColor.white,
                                  strColor: CustomColor.ivory2,
                                  defaultValue: alarmDay[(30 -
                                          (DateTime.now().day -
                                              controller.calendarForm.value
                                                  .alarmTime.day))
                                      .toInt()],
                                  setValue: (int index) => controller
                                      .calendarForm.value.alarmTime = DateTime(
                                    DateTime.now().year,
                                    DateTime.now().month,
                                    (DateTime.now().day - (30 - index)),
                                    controller
                                        .calendarForm.value.alarmTime.hour,
                                    controller
                                        .calendarForm.value.alarmTime.minute,
                                  ),
                                ),
                                DialBoxWidget(
                                  label: DateFormat('a hh:mm', 'ko').format(
                                      controller.calendarForm.value.alarmTime),
                                  onSave: (DateTime dateTime) => controller
                                      .calendarForm.value.alarmTime = dateTime,
                                  dialType: DialType.TIME,
                                  scheduleTime:
                                      controller.calendarForm.value.alarmTime,
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
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
