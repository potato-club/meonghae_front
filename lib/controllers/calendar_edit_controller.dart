import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/models/calendar_model.dart';

import '../data/filter_categories.dart';

class CalendarEditController extends GetxController {
  var editData = CalendarDetailModel(
    id: 0,
    petName: '',
    alarmTime: null,
    cycle: null,
    cycleCount: null,
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

  void initEditData() {
    editData.value = CalendarDetailModel(
      id: 0,
      petName: '',
      alarmTime: null,
      cycle: null,
      cycleCount: null,
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
  }

  void goEditScreen(CalendarDetailModel data) {
    initEditData();
    editData.value = data;
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
}
