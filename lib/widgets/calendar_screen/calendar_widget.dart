import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime, List<Event>) onSelectedDay;
  const CalendarWidget({super.key, required this.onSelectedDay});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class Event {
  DateTime startTime;
  DateTime endTime;
  String title;
  Event(this.startTime, this.endTime, this.title);

  String getStartTime() {
    return DateFormat('a h:mm', 'ko_KR').format(startTime);
  }

  String getEndTime() {
    return DateFormat('a h:mm', 'ko_KR').format(endTime);
  }

  String getTitle() {
    return title;
  }
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime focusedDay = DateTime.now();
  DateTime firstDay = DateTime(DateTime.now().year - 1);
  DateTime lastDay = DateTime(DateTime.now().year + 1, 12, 31);
  Map<DateTime, List<Event>> events = {
    DateTime.utc(2023, 5, 5): [
      Event(
        DateTime(2023, 5, 5, 10, 0, 0, 0),
        DateTime(2023, 5, 5, 12, 0, 0, 0),
        '멍멍이 예방주사 맞는 날',
      ),
      Event(
        DateTime(2023, 5, 5, 15, 0, 0, 0),
        DateTime(2023, 5, 5, 17, 30, 0, 0),
        '멍멍이 신발 사주는 날',
      ),
      Event(
        DateTime(2023, 5, 6, 9, 0, 0, 0),
        DateTime(2023, 5, 6, 11, 0, 0, 0),
        '야옹이 예방주사 맞는 날',
      ),
      Event(
        DateTime(2023, 5, 5, 10, 0, 0, 0),
        DateTime(2023, 5, 5, 12, 0, 0, 0),
        '멍멍이 예방주사 맞는 날',
      ),
      Event(
        DateTime(2023, 5, 5, 15, 0, 0, 0),
        DateTime(2023, 5, 5, 17, 30, 0, 0),
        '멍멍이 신발 사주는 날',
      ),
      Event(
        DateTime(2023, 5, 6, 9, 0, 0, 0),
        DateTime(2023, 5, 6, 11, 0, 0, 0),
        '야옹이 예방주사 맞는 날',
      ),
      Event(
        DateTime(2023, 5, 5, 10, 0, 0, 0),
        DateTime(2023, 5, 5, 12, 0, 0, 0),
        '멍멍이 예방주사 맞는 날',
      ),
      Event(
        DateTime(2023, 5, 5, 15, 0, 0, 0),
        DateTime(2023, 5, 5, 17, 30, 0, 0),
        '멍멍이 신발 사주는 날',
      ),
      Event(
        DateTime(2023, 5, 6, 9, 0, 0, 0),
        DateTime(2023, 5, 6, 11, 0, 0, 0),
        '야옹이 예방주사 맞는 날',
      )
    ],
    DateTime.utc(2023, 5, 6): [
      Event(
        DateTime(2023, 5, 6, 9, 0, 0, 0),
        DateTime(2023, 5, 6, 11, 0, 0, 0),
        '야옹이 예방주사 맞는 날',
      )
    ],
  };

  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  @override
  void initState() {
    super.initState();
    DateTime day =
        DateTime(focusedDay.year, focusedDay.month, focusedDay.day).toUtc();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.onSelectedDay(day, events[day] ?? []);
    });
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    widget.onSelectedDay(selectedDay, _getEventsForDay(selectedDay));
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: CustomColor.black2,
          ),
          weekendStyle: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: CustomColor.black2,
          ),
        ),
        headerStyle: HeaderStyle(
            formatButtonVisible: false,
            titleTextStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: CustomColor.black2,
            ),
            leftChevronVisible: false,
            rightChevronVisible: false,
            headerMargin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.03 + 8,
              vertical: 12,
            )),
        calendarStyle: const CalendarStyle(
          defaultTextStyle: TextStyle(
            color: CustomColor.black2,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          todayDecoration: BoxDecoration(
            color: CustomColor.brown1,
            shape: BoxShape.circle,
          ),
          todayTextStyle: TextStyle(
            color: CustomColor.black2,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          weekendTextStyle: TextStyle(
            color: CustomColor.black2,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          holidayTextStyle: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
          outsideTextStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: CustomColor.lightGray2,
          ),
          // marker style
          canMarkersOverflow: false,
          markersAutoAligned: true,
          markerSize: 4,
          markersMaxCount: 1,
          markerDecoration: BoxDecoration(
            color: CustomColor.black2,
            shape: BoxShape.circle,
          ),
        ),
        daysOfWeekHeight: 50,
        locale: 'ko_KR',
        focusedDay: focusedDay,
        firstDay: firstDay,
        lastDay: lastDay,
        calendarFormat: CalendarFormat.month,
        eventLoader: _getEventsForDay,
        onDaySelected: onDaySelected);
  }
}
