import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/additional_info_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/dog_select_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/filter_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/top_menu_bar_widget.dart';

class CalendarInfoScreen extends StatefulWidget {
  const CalendarInfoScreen({super.key});

  @override
  State<CalendarInfoScreen> createState() => _CalendarInfoScreenState();
}

class _CalendarInfoScreenState extends State<CalendarInfoScreen> {
  List<dynamic>? dogsInfo;
  Map<String, dynamic> calendarData = {
    'petId': null,
    'title': null,
    'vaccinationType': null,
    'isRepeat': false,
    'repeat': {
      'term': {'month': 0, 'day': 7},
      'times': 3
    },
    'isAlarm': true,
    'alarmTime': DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 0),
    'memo': null,
    'scheduleTime': DateTime.now(),
  };

  void setCalendarData(String key, dynamic data) {
    setState(() => calendarData[key] = data);
  }

  @override
  void initState() {
    _getDogsInfo();
    super.initState();
  }

  Future<void> _getDogsInfo() async {
    SendAPI.get(
      context: context,
      url: '/profile-service/profile',
      successFunc: (data) => setState(() => dogsInfo = data.data),
      errorMsg: "애완동물정보 호출에 실패하였습니다",
    );
  }

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
    //     Navigator.pop(context);
    //     SnackBarWidget.show(context, SnackBarType.check, "성공적으로 일정을 등록했습니다");
    //   },
    //   errorMsg: "일정 등록에 실패하였습니다",
    // );
    // } else {
    //   SnackBarWidget.show(context, SnackBarType.error, "모든 정보를 입력해주세요");
    // }
  }

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
              DogSelectWidget(
                dogsInfo: dogsInfo,
                calendarData: calendarData,
                setCalendarData: setCalendarData,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: FilterWidget(
                  calendarData: calendarData,
                  setCalendarData: setCalendarData,
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: AdditionalInfoWidget(
                  calendarData: calendarData,
                  setCalendarData: setCalendarData,
                ),
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
                child: TopMenuBarWidget(handleSave: handleSave)))
      ]),
    );
  }
}
