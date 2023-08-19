import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/calendar_form_model.dart';
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class CalendarController extends GetxController {
  Rx<CalendarFormModel> calendarForm = CalendarFormModel(
    petId: null,
    alarmTime: DateTime.now(),
    alarmDate: 0,
    cycle: null,
    cycleCount: 2,
    cycleType: null,
    hasRepeat: false,
    hasAlarm: false,
    scheduleTime: DateTime.now(),
    scheduleType: null,
  ).obs;
  var customMode = false.obs;
  final TextEditingController memoController = TextEditingController();
  var isSending = false.obs;

  Future<void> addCalendar() async {
    if (!isSending.value) {
      if (calendarForm.value.isFilled()) {
        SendAPI.post(
          url: "/profile-service/profile/calendar",
          request: {
            'petId': calendarForm.value.petId,
            'scheduleType':
                customMode.value ? 'Custom' : calendarForm.value.scheduleType,
            if (customMode.value)
              'customScheduleTitle': calendarForm.value.scheduleType,
            'scheduleTime': DateFormat('yyyy-MM-ddTHH:mm')
                .format(calendarForm.value.scheduleTime),
            if (memoController.text.isNotEmpty) 'text': memoController.text,
            'hasRepeat': calendarForm.value.hasRepeat,
            if (calendarForm.value.hasRepeat) ...{
              'cycle': calendarForm.value.cycle,
              'cycleType': calendarForm.value.cycleType,
              'cycleCount': calendarForm.value.cycleCount
            },
            'hasAlarm': calendarForm.value.hasAlarm,
            if (calendarForm.value.hasAlarm)
              'alarmTime': calendarForm.value.alarmTimeFormat(
                  calendarForm.value.alarmDate, calendarForm.value.alarmTime),
          },
          successFunc: (data) {
            Get.back();
            clear();
            //fetch추가
            SnackBarWidget.show(SnackBarType.check, "성공적으로 일정을 등록했어요");
          },
          errorMsg: "일정 등록에 실패하였어요",
        );
      } else {
        SnackBarWidget.show(SnackBarType.error, "모든 정보를 입력해주세요");
      }
    }
  }

  void clear() {
    calendarForm.value = CalendarFormModel(
      petId: null,
      alarmTime: DateTime.now(),
      alarmDate: 0,
      cycle: null,
      cycleCount: 2,
      cycleType: null,
      hasRepeat: false,
      hasAlarm: false,
      scheduleTime: DateTime.now(),
      scheduleType: null,
    );
    customMode.value = false;
    memoController.clear();
  }

  Future<bool> willPop() async {
    CustomWarningModalWidget.show(
        '페이지를 나가시겠어요?', '지금까지 작성했던 내용들은\n지워지게 되므로 유의해주세요', () {
      Get.back();
      clear();
    });
    return true;
  }

  Map<String, int> cycleList = {
    '2회 반복': 2,
    '3회 반복': 3,
    '4회 반복': 4,
    '5회 반복': 5,
    '계속 반복': 0
  };
  Map<String, int> alarmList = {
    '7일 전': -7,
    '6일 전': -6,
    '5일 전': -5,
    '4일 전': -4,
    '3일 전': -3,
    '2일 전': -2,
    '1일 전': -1,
    '당일': 0,
    '1일 후': 1,
    '2일 후': 2,
    '3일 후': 3,
    '4일 후': 4,
    '5일 후': 5,
    '6일 후': 6,
    '7일 후': 7,
  };
}
