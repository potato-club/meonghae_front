import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/additional_info_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/dog_select_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/filter_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/top_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

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
    try {
      Dio dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      final response = await dio.get('${baseUrl}profile-service/profile');
      if (response.statusCode == 200) {
        dogsInfo = await response.data;
        setState(() {});
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "애완동물정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  Future<void> handleSave() async {
    // if (content != null &&
    //     (isAllday || (time['date'] != null && time['time'] != null))) {
    //   try {
    //     Dio dio = Dio();
    //     var token = await readAccessToken();
    //     dio.options.headers['Authorization'] = token;
    //     final response =
    //         await dio.post('${baseUrl}profile-service/profile/calendar', data: {
    //       "petId": petId,
    //       "scheduleTime":
    //           isAllday ? "2023-06-14T00:00" : "${time['date']}T${time['time']}",
    //       "text": content
    //     });
    //     if (response.statusCode == 200) {
    //       Navigator.pop(context);
    //       SnackBarWidget.show(context, SnackBarType.check, "성공적으로 일정을 등록했습니다");
    //     } else {
    //       SnackBarWidget.show(context, SnackBarType.error, "일정 등록에 실패하였습니다");
    //     }
    //   } catch (error) {
    //     SnackBarWidget.show(context, SnackBarType.error, error.toString());
    //   }
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
