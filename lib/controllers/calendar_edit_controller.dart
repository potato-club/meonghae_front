import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/controllers/home_controller.dart';
import 'package:meonghae_front/models/calendar_model.dart';
import 'package:meonghae_front/widgets/common/custom_modal_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

import '../data/filter_categories.dart';

class CalendarEditController extends GetxController {
  var editData = CalendarDetailModel(
    id: 0,
    petId: null,
    petName: null,
    alarmTime: null,
    cycle: null,
    cycleCount: 2,
    cycleType: null,
    hasRepeat: false,
    hasAlarm: false,
    scheduleType: '',
    scheduleTime: '',
    customScheduleTitle: null,
    text: null,
  ).obs;
  var customMode = false.obs;
  var category = ''.obs;
  var detailIndex = (-1).obs;
  var alarmDate = 0.obs;
  var titleController = TextEditingController().obs;
  var memoController = TextEditingController().obs;
  var cycleMonthController = TextEditingController().obs;
  var cycleDayController = TextEditingController().obs;
  var isLoading = false.obs;

  void initEditData() {
    editData.value = CalendarDetailModel(
      id: 0,
      petId: null,
      petName: null,
      alarmTime: null,
      cycle: null,
      cycleCount: 2,
      cycleType: null,
      hasRepeat: false,
      hasAlarm: false,
      scheduleType: '',
      scheduleTime: '',
      customScheduleTitle: null,
      text: null,
    );
    customMode.value = false;
    category.value = '';
    detailIndex.value = -1;
    cycleMonthController.value.clear();
    cycleDayController.value.clear();
    titleController.value.clear();
    memoController.value.clear();
  }

  void setEditData(CalendarDetailModel data) {
    editData.value = CalendarDetailModel(
      id: data.id,
      petId: data.petId,
      petName: data.petName,
      alarmTime: data.alarmTime,
      cycle: data.cycle,
      cycleCount: data.cycleCount,
      cycleType: data.cycleType,
      hasRepeat: data.hasRepeat,
      hasAlarm: data.hasAlarm,
      scheduleType: data.scheduleType,
      scheduleTime: data.scheduleTime,
      customScheduleTitle: data.customScheduleTitle,
      text: data.text,
    );
  }

  void goEditScreen(CalendarDetailModel data) {
    initEditData();
    setEditData(data);
    setFilter();
    setRepeat();
    setAlarm();
    setMemo();
    Get.toNamed(AppRoutes.calendarEdit);
  }

  void setFilter() {
    if (editData.value.scheduleType == 'Custom') {
      customMode.value = true;
      category.value = categoryKey[0];
      titleController.value.text = editData.value.customScheduleTitle!;
    } else {
      for (String key in categoryKey) {
        for (var i = 0; i < categoryDetail[key].length; i++) {
          if (categoryDetail[key][i]['value'] == editData.value.scheduleType) {
            category.value = key;
            detailIndex.value = i;
          }
        }
      }
    }
  }

  void setRepeat() {
    if (editData.value.hasRepeat) {
      if (editData.value.cycleType == 'Month') {
        cycleMonthController.value.text = editData.value.cycleCount.toString();
      } else {
        cycleDayController.value.text = editData.value.cycleCount.toString();
      }
    }
  }

  void setAlarm() {
    if (editData.value.hasAlarm) {
      var schedule = DateTime.parse(editData.value.scheduleTime);
      var alarm = DateTime.parse(editData.value.alarmTime!);
      alarmDate.value = DateTime(alarm.year, alarm.month, alarm.day)
          .difference(DateTime(schedule.year, schedule.month, schedule.day))
          .inDays;
    }
  }

  void setMemo() {
    if (editData.value.text != null) {
      memoController.value.text = editData.value.text!;
    }
  }

  Future<void> editCalendarData() async {
    isLoading.value = true;
    if (editData.value.isFilled(customMode.value, titleController.value.text)) {
      await SendAPI.put(
          url: "/profile-service/profile/calendar/${editData.value.id}",
          request: {
            "petId": editData.value.petId ?? 'nonPet',
            "scheduleType":
                customMode.value ? 'Custom' : editData.value.scheduleType,
            if (customMode.value)
              'customScheduleTitle': titleController.value.text,
            "scheduleTime": editData.value.scheduleTime,
            if (memoController.value.text.isNotEmpty)
              "text": memoController.value.text,
            "hasAlarm": editData.value.hasAlarm,
            "hasRepeat": editData.value.hasRepeat,
            if (editData.value.hasRepeat) ...{
              'cycle': editData.value.cycleType == 'Month'
                  ? cycleMonthController.value.text
                  : cycleDayController.value.text,
              'cycleType': editData.value.cycleType,
              'cycleCount': editData.value.cycleCount
            },
            if (editData.value.hasAlarm)
              "alarmTime": editData.value.alarmTimeFormat(alarmDate.value,
                  editData.value.alarmTime!, editData.value.scheduleTime),
          },
          successFunc: (data) async {
            Get.back();
            SnackBarWidget.show(SnackBarType.check, "성공적으로 기록을 수정했어요");
            await Get.find<CalendarController>().fetchData();
            await Get.find<CalendarController>().clickDay();
            await Get.find<HomeController>().getSchedulePreview();
          },
          errorMsg: "기록 수정에 실패하였어요");
    }
    isLoading.value = false;
  }

  Future<void> deleteCalendarData() async {
    CustomModalWidget.show('기록을 삭제하시겠어요?', () async {
      isLoading.value = true;
      await SendAPI.delete(
          url: "/profile-service/profile/calendar/${editData.value.id}",
          successFunc: (data) async {
            Get.back();
            SnackBarWidget.show(SnackBarType.check, "성공적으로 기록을 삭제했어요");
            await Get.find<CalendarController>().fetchData();
            await Get.find<CalendarController>().clickDay();
            await Get.find<HomeController>().getSchedulePreview();
          },
          errorMsg: "기록 삭제에 실패하였어요");
      isLoading.value = false;
    });
  }
}
