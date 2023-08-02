import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/screens/calendar_info_screen.dart';
import 'package:meonghae_front/screens/calendar_search_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_screen/calendar_widget.dart';
import 'package:meonghae_front/widgets/calendar_screen/info_content_widget.dart';
import 'package:meonghae_front/widgets/svg/plus.dart';
import 'package:meonghae_front/widgets/svg/search.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  List<dynamic> events = [];
  List<dynamic> event = [];

  @override
  void initState() {
    getCalendarData(focusedDay.year, focusedDay.month);
    super.initState();
  }

  String formatDate(int date) {
    return date.toString().padLeft(2, '0');
  }

  Future<void> getCalendarData(int year, int month) async {
    SendAPI.get(
        url: "/profile-service/profile/calendar",
        request: {'year': year, 'month': month},
        successFunc: (data) {
          events = data.data;
          if (selectedDay.year == focusedDay.year &&
              selectedDay.month == focusedDay.month) {
            setState(() => event = events
                .where((e) =>
                    e['scheduleTime'].toString().split('T')[0] ==
                    "${selectedDay.year}-${formatDate(selectedDay.month)}-${formatDate(selectedDay.day)}")
                .toList());
          }
        },
        errorMsg: "캘린더정보 호출에 실패하였습니다");
  }

  void onFocusedDay(DateTime day) {
    setState(() {
      focusedDay = day;
    });
  }

  void onSelectedDay(DateTime day) {
    setState(() {
      selectedDay = day;
      event = events
          .where((e) =>
              e['scheduleTime'].toString().split('T')[0] ==
              "${selectedDay.year}-${formatDate(selectedDay.month)}-${formatDate(selectedDay.day)}")
          .toList();
    });
  }

  List<dynamic> _getEventsForDay(DateTime day) {
    String formatDay =
        "${day.year}-${formatDate(day.month)}-${formatDate(day.day)}";
    return events
        .where((e) => e['scheduleTime'].toString().split('T')[0] == formatDay)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 36,
              right: MediaQuery.of(context).size.width * 0.03,
              left: MediaQuery.of(context).size.width * 0.03,
            ),
            child: CalendarWidget(
              event: event,
              onSelectedDay: onSelectedDay,
              onFocusedDay: onFocusedDay,
              selectedDay: selectedDay,
              focusedDay: focusedDay,
              getEventForDay: _getEventsForDay,
              getCalendarData: getCalendarData,
            ),
          ),
          Positioned(
            top: 58,
            right: MediaQuery.of(context).size.width * 0.03 + 56,
            child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const CalendarSearchScreen())),
                child: const SearchSVG(strokeColor: CustomColor.black2)),
          ),
          Positioned(
            top: 58,
            right: MediaQuery.of(context).size.width * 0.03 + 16,
            child: GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) =>
                        const CalendarInfoScreen())),
                child: const PlusSVG(color: CustomColor.black2)),
          ),
          Positioned(
            bottom: 72,
            child: InfoContentWidget(
              events: event,
              selectedDay: selectedDay,
            ),
          ),
          const Positioned(
            bottom: 0,
            child: UnderBarWidget(currentScreen: '캘린더'),
          ),
        ],
      ),
    );
  }
}
