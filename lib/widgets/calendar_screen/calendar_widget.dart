import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/calendar_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<CalendarController>(builder: (controller) {
      return Column(
        children: [
          Text(
            '${controller.selectedDay.value}${controller.monthEvents}',
            style: const TextStyle(fontSize: 0),
          ),
          TableCalendar(
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
                  var now = DateTime.now();
                  return Transform.translate(
                    offset: const Offset(0, -12),
                    child: Container(
                      decoration: BoxDecoration(
                          color: (!(day.year == now.year &&
                                      day.month == now.month &&
                                      day.day == now.day) &&
                                  day == controller.selectedDay.value)
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
                isSameDay(controller.selectedDay.value, day) &&
                !isSameDay(controller.selectedDay.value, DateTime.now()),
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
            focusedDay: controller.focusedDay.value,
            firstDay: DateTime(DateTime.now().year - 1),
            lastDay: DateTime(DateTime.now().year + 1, 12, 31),
            calendarFormat: CalendarFormat.month,
            eventLoader: (day) {
              for (var event in controller.monthEvents) {
                if (controller.focusedDay.value.month == day.month &&
                    event.day == day.day) {
                  return event.scheduleIds;
                }
              }
              return [];
            },
            onDaySelected: (selectedDay, focusedDay) {
              controller.selectedDay(selectedDay);
              controller.clickDay();
            },
            onPageChanged: (focusedDay) {
              controller.setFocusedDay(focusedDay);
              controller.fetchData();
            },
            currentDay: DateTime.now(),
          ),
        ],
      );
    });
  }
}
