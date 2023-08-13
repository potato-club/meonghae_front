import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meonghae_front/models/calendar_form_model.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class CalendarController extends GetxController {
  var calendarForm = CalendarFormModel(
    petId: null,
    text: null,
    alarmTime: DateTime.now(),
    cycle: null,
    cycleCount: 2,
    cycleType: null,
    hasRepeat: false,
    scheduleTime: DateTime.now(),
    scheduleType: null,
  ).obs;
  final TextEditingController memoController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  var isAlarm = true.obs;
  Map<String, int> cycleList = {
    '2회 반복': 2,
    '3회 반복': 3,
    '4회 반복': 4,
    '5회 반복': 5,
    '계속 반복': 0
  };

  Future<void> handleSave() async {
    // if (content != null &&
    //     (isAllday || (time['date'] != null && time['time'] != null))) {
    // SendAPI.post(
    //   context: context,
    //   url: "/profile-service/profile/calendar",
    //   request: {
    //     "petId": petId,
    //     "scheduleTime":
    //         isAllday ? "2023-06-14T00:00" : "${time['date']}T${time['time']}",
    //     "text": content
    //   },
    //   successFunc: (data) {
    //     Get.back();
    //     SnackBarWidget.show(context, SnackBarType.check, "성공적으로 일정을 등록했어요");
    //   },
    //   errorMsg: "일정 등록에 실패하였어요",
    // );
    // } else {
    //   SnackBarWidget.show(context, SnackBarType.error, "모든 정보를 입력해주세요");
    // }
  }
}
