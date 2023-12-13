import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/calendar_model.dart';
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
  var isLoading = false.obs;
  var selectedDay = DateTime.now().obs;
  var focusedDay = DateTime.now().obs;
  var monthEvents = <CalendarModel>[].obs;
  var dayEvents = <CalendarDetailModel>[].obs;
  var searchEvents = <CalendarDetailModel>[].obs;

  String parseTimeString(String time) {
    DateTime dateTime = DateTime.parse(time);
    String formattedTime = DateFormat('a hh:mm').format(dateTime);
    return formattedTime;
  }

  @override
  void onInit() {
    clickDay();
    super.onInit();
  }

  void setSelectedDay(DateTime date) {
    selectedDay.value = date;
  }

  void setFocusedDay(DateTime date) {
    focusedDay.value = date;
  }

  Future<void> search(String key) async {
    if (key.length > 1) {
      isLoading.value = true;
      await SendAPI.get(
          url: "/profile-service/profile/calendar/find",
          params: {'key': key},
          successFunc: (data) {
            List<Map<String, dynamic>> contentList =
                List<Map<String, dynamic>>.from(data.data);
            final List<CalendarDetailModel> eventsList = contentList
                .map((json) => CalendarDetailModel.fromJson(json))
                .toList();
            searchEvents.value = eventsList;
          },
          errorMsg: "일정 검색에 실패하였어요");
      isLoading.value = false;
    } else {
      SnackBarWidget.show(SnackBarType.error, '2글자 이상의 단어를 검색해주세요');
    }
  }

  Future<void> clickDay() async {
    for (var monthEvent in monthEvents) {
      if (monthEvent.month == selectedDay.value.month) {
        for (var schedule in monthEvent.schedules) {
          if (schedule['day'] == selectedDay.value.day) {
            await SendAPI.get(
                url: "/profile-service/profile/calendar/day",
                request: {
                  'year': focusedDay.value.year,
                  'month': focusedDay.value.month,
                  'day': focusedDay.value.day,
                  'scheduleId': schedule['scheduleIds'],
                },
                successFunc: (data) {
                  List<Map<String, dynamic>> contentList =
                      List<Map<String, dynamic>>.from(data.data);
                  final List<CalendarDetailModel> eventsList = contentList
                      .map((json) => CalendarDetailModel.fromJson(json))
                      .toList();
                  dayEvents.value = eventsList;
                },
                errorMsg: "일정 호출에 실패하였어요");
            return;
          }
        }
      }
    }
    dayEvents.value = [];
  }

  Future<void> fetchData() async {
    await SendAPI.get(
        url: "/profile-service/profile/calendar/month",
        params: {
          'year': focusedDay.value.year,
          'month': focusedDay.value.month,
        },
        successFunc: (data) {
          List<Map<String, dynamic>> contentList =
              List<Map<String, dynamic>>.from(data.data);
          final List<CalendarModel> eventsList =
              contentList.map((json) => CalendarModel.fromJson(json)).toList();
          monthEvents.value = eventsList;
          print(data.data);
        },
        errorMsg: "캘린더 정보 호출에 실패하였어요");
  }

  void clear() {
    selectedDay.value = DateTime.now();
    focusedDay.value = DateTime.now();
    fetchData();
    clickDay();
  }

  Future<void> addCalendar() async {
    if (!isSending.value) {
      if (calendarForm.value.isFilled(customMode.value)) {
        isSending.value = true;
        print(
            "${calendarForm.value.petId}//${calendarForm.value.scheduleType}//${DateFormat('yyyy-MM-ddTHH:mm').format(calendarForm.value.scheduleTime)}//${calendarForm.value.hasRepeat}//${calendarForm.value.cycle}//${calendarForm.value.cycleType}//${calendarForm.value.cycleCount}");
        await SendAPI.post(
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
          successFunc: (data) async {
            Get.back();
            clearForm();
            await fetchData();
            await clickDay();
            SnackBarWidget.show(SnackBarType.check, "성공적으로 일정을 등록했어요");
          },
          errorMsg: "일정 등록에 실패하였어요",
        );
        isSending.value = false;
      } else {
        SnackBarWidget.show(SnackBarType.error, "모든 정보를 입력해주세요");
      }
    }
  }

  void clearForm() {
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
    isSending.value = false;
    customMode.value = false;
    memoController.clear();
  }

  Future<bool> willPop() async {
    CustomWarningModalWidget.show(
        '페이지를 나가시겠어요?', '지금까지 작성했던 내용들은\n지워지게 되므로 유의해주세요', () {
      Get.back();
      clearForm();
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
