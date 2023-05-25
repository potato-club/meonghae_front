import 'package:flutter/material.dart';
import 'package:meonghae_front/widgets/calendar_screen/calendar_widget.dart';
import 'package:meonghae_front/widgets/calendar_screen/info_content_widget.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime selectedDay = DateTime.now();
  List<Event> events = [];

  @override
  void initState() {
    super.initState();
  }

  void onSelectedDay(DateTime day, List<Event> e) {
    setState(() => {selectedDay = day, events = e});
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
              onSelectedDay: onSelectedDay,
            ),
          ),
          Positioned(
            top: 59,
            right: MediaQuery.of(context).size.width * 0.03 + 52,
            child: GestureDetector(
              onTap: () => {},
              child: const Image(
                image: AssetImage('assets/images/icon/search.png'),
                width: 21,
              ),
            ),
          ),
          Positioned(
            top: 60,
            right: MediaQuery.of(context).size.width * 0.03 + 16,
            child: GestureDetector(
              onTap: () => {},
              child: const Image(
                image: AssetImage('assets/images/icon/plus.png'),
                width: 19,
              ),
            ),
          ),
          Positioned(
            bottom: 72,
            child: InfoContentWidget(
              events: events,
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
