import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  final Function(DateTime) onSelectedDay;
  final Function(DateTime) onFocusedDay;
  final Function(DateTime) getEventForDay;
  final Function getCalendarData;
  final List<dynamic> event;
  final DateTime selectedDay;
  final DateTime focusedDay;
  const CalendarWidget(
      {super.key,
      required this.onSelectedDay,
      required this.event,
      required this.selectedDay,
      required this.getEventForDay,
      required this.getCalendarData,
      required this.onFocusedDay,
      required this.focusedDay});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      calendarBuilders: CalendarBuilders(
        selectedBuilder: (context, date, _) {
          return Container(
              decoration: BoxDecoration(
                border: Border.all(color: CustomColor.brown1, width: 1),
                shape: BoxShape.circle,
              ),
              width: 36,
              height: 36,
              margin: const EdgeInsets.only(bottom: 8),
              child: Center(
                child: Text('${date.day}',
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.brown1)),
              ));
        },
        markerBuilder: (context, day, events) {
          if (events.isNotEmpty) {
            return Transform.translate(
              offset: const Offset(0, -12),
              child: Container(
                decoration: BoxDecoration(
                    color: day == widget.selectedDay
                        ? CustomColor.brown1
                        : CustomColor.black2,
                    shape: BoxShape.circle),
                width: 4,
                height: 4,
              ),
            );
          }
          return null;
        },
      ),
      selectedDayPredicate: (day) =>
          isSameDay(widget.selectedDay, day) &&
          !isSameDay(widget.selectedDay, DateTime.now()),
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
            horizontal: MediaQuery.of(context).size.width * 0.03,
            vertical: 12,
          )),
      calendarStyle: const CalendarStyle(
        defaultTextStyle: TextStyle(
          color: CustomColor.black2,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        todayDecoration: BoxDecoration(
          color: CustomColor.brown1,
          shape: BoxShape.circle,
        ),
        todayTextStyle: TextStyle(
          color: CustomColor.black2,
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
        weekendTextStyle: TextStyle(
          color: CustomColor.black2,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
        outsideTextStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: CustomColor.lightGray2,
        ),
        // marker style
        canMarkersOverflow: false,
        markersAutoAligned: true,
        markersMaxCount: 1,
      ),
      daysOfWeekHeight: 50,
      availableGestures: AvailableGestures.horizontalSwipe,
      locale: 'ko_KR',
      focusedDay: widget.focusedDay,
      firstDay: DateTime(DateTime.now().year - 1),
      lastDay: DateTime(DateTime.now().year + 1, 12, 31),
      calendarFormat: CalendarFormat.month,
      eventLoader: (day) => widget.getEventForDay(day),
      onDaySelected: (selectedDay, focusedDay) =>
          widget.onSelectedDay(selectedDay),
      onPageChanged: (focusedDay) {
        widget.onFocusedDay(focusedDay);
        widget.getCalendarData(focusedDay.year, focusedDay.month);
      },
      currentDay: DateTime.now(),
    );
  }
}
