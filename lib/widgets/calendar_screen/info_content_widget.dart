import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_screen/calendar_widget.dart';
import 'package:meonghae_front/widgets/calendar_screen/info_item_widget.dart';
import 'package:meonghae_front/widgets/calendar_screen/no_info_widget.dart';

class InfoContentWidget extends StatefulWidget {
  final DateTime selectedDay;
  final List<Event> events;
  const InfoContentWidget({
    super.key,
    required this.selectedDay,
    required this.events,
  });

  @override
  State<InfoContentWidget> createState() => _InfoContentWidgetState();
}

class _InfoContentWidgetState extends State<InfoContentWidget> {
  double _containerHeight = 0;
  void _onVerticalDragUpdate(DragUpdateDetails details) {
    setState(() {
      if (details.delta.dy > -0.9) {
        _containerHeight = 0;
      } else {
        _containerHeight = 200;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> dayOfWeek = ["월", "화", "수", "목", "금", "토", "일"];
    return GestureDetector(
      onVerticalDragUpdate: _onVerticalDragUpdate,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.ease,
        height: MediaQuery.of(context).size.height - 560 + _containerHeight,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: CustomColor.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
                color: CustomColor.black1.withOpacity(0.12),
                offset: const Offset(0, -4),
                blurRadius: 12,
                spreadRadius: 0)
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: CustomColor.lightGray1,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${widget.selectedDay.day}일 ${dayOfWeek[widget.selectedDay.weekday - 1]}요일",
                    style: const TextStyle(
                      fontSize: 16,
                      color: CustomColor.brown1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  widget.events.isEmpty
                      ? const NoInfoWidget()
                      : SizedBox(
                          height: MediaQuery.of(context).size.height -
                              637 +
                              _containerHeight,
                          child: _containerHeight == 0
                              ? Card(
                                  elevation: 0,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  clipBehavior: Clip.none,
                                  child: Wrap(
                                    children: [
                                      for (var i = 0;
                                          i < widget.events.length;
                                          i++)
                                        InfoItemWidget(
                                          startTime:
                                              widget.events[i].getStartTime(),
                                          endTime:
                                              widget.events[i].getStartTime(),
                                          title: widget.events[i].getTitle(),
                                          isEndItem: false,
                                        ),
                                    ],
                                  ),
                                )
                              : SingleChildScrollView(
                                  child: Card(
                                    elevation: 0,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.zero,
                                    ),
                                    clipBehavior: Clip.none,
                                    child: Wrap(
                                      children: [
                                        for (var i = 0;
                                            i < widget.events.length;
                                            i++)
                                          InfoItemWidget(
                                            startTime:
                                                widget.events[i].getStartTime(),
                                            endTime:
                                                widget.events[i].getStartTime(),
                                            title: widget.events[i].getTitle(),
                                            isEndItem: false,
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
