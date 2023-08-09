import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
    'alarm': {'day': 0, 'time': ''},
    'memo': null,
    'scheduleTime': DateFormat('yyyyMMdd').format(DateTime.now())
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
      url: '/profile-service/profile',
      successFunc: (data) => setState(() => dogsInfo = data.data),
      errorMsg: "애완동물정보 호출에 실패하였어요",
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
    //     Get.back();
    //     SnackBarWidget.show(context, SnackBarType.check, "성공적으로 일정을 등록했어요");
    //   },
    //   errorMsg: "일정 등록에 실패하였어요",
    // );
    // } else {
    //   SnackBarWidget.show(context, SnackBarType.error, "모든 정보를 입력해주세요");
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.brown1,
      body: Column(
        children: [
          const SizedBox(height: 32),
          TopMenuBarWidget(handleSave: handleSave),
          const SizedBox(height: 4),
          Expanded(
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 26),
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
            ]),
          )
        ],
      ),
    );
  }
}
