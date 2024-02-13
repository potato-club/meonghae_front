import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class DateSelectModalWidget extends StatefulWidget {
  final DateTime scheduleTime;
  final Function onSave;
  final Function handleClose;
  const DateSelectModalWidget({
    super.key,
    required this.onSave,
    required this.handleClose,
    required this.scheduleTime,
  });

  @override
  State<DateSelectModalWidget> createState() => _DateSelectModalWidgetState();
}

DateTime now = DateTime.now();

class _DateSelectModalWidgetState extends State<DateSelectModalWidget> {
  int currentYear = 0;
  int currentMonth = 0;
  int currentDay = 0;

  @override
  void initState() {
    currentYear = widget.scheduleTime.year - DateTime.now().year;
    currentMonth = widget.scheduleTime.month - 1;
    currentDay = widget.scheduleTime.day - 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: GestureDetector(
        onTap: () => widget.handleClose(),
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: CustomColor.black1.withOpacity(0.2)),
      )),
      Positioned(
        child: Center(
          child: Container(
            width: 240,
            height: 293,
            decoration: BoxDecoration(
                color: CustomColor.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 148,
                    child: Stack(children: [
                      Positioned(
                          child: Center(
                        child: Container(
                          width: 212,
                          height: 30,
                          decoration: BoxDecoration(
                            color: CustomColor.brown1,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 33,
                              child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 148,
                                    scrollDirection: Axis.vertical,
                                    initialPage: currentYear,
                                    viewportFraction: 0.2,
                                    enableInfiniteScroll: false,
                                    onPageChanged: (index, reason) =>
                                        setState(() => currentYear = index),
                                  ),
                                  items: [
                                    for (int i = 0; i < 50; i++)
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            "${now.year + i}",
                                            style: i == currentYear
                                                ? const TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: CustomColor.black2,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                : (i - currentYear).abs() == 1
                                                    ? const TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        color: CustomColor.gray,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )
                                                    : const TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        color: CustomColor
                                                            .lightGray3,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                          )),
                                  ]),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                right: 30,
                                left: 4,
                              ),
                              child: Text(
                                '년',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: CustomColor.black2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 17,
                              child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 148,
                                    initialPage: widget.scheduleTime.month - 1,
                                    scrollDirection: Axis.vertical,
                                    viewportFraction: 0.2,
                                    enableInfiniteScroll: true,
                                    onPageChanged: (index, reason) =>
                                        setState(() => currentMonth = index),
                                  ),
                                  items: [
                                    for (int i = 0; i < 12; i++)
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            (i + 1).toString().padLeft(2, '0'),
                                            style: i == currentMonth
                                                ? const TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: CustomColor.black2,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                : (i - currentMonth).abs() == 1
                                                    ? const TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        color: CustomColor.gray,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      )
                                                    : const TextStyle(
                                                        decoration:
                                                            TextDecoration.none,
                                                        color: CustomColor
                                                            .lightGray3,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                          )),
                                  ]),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                right: 30,
                                left: 4,
                              ),
                              child: Text(
                                '월',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: CustomColor.black2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 17,
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height: 148,
                                  initialPage: widget.scheduleTime.day - 1,
                                  scrollDirection: Axis.vertical,
                                  viewportFraction: 0.2,
                                  enableInfiniteScroll: true,
                                  onPageChanged: (index, reason) =>
                                      setState(() => currentDay = index),
                                ),
                                items: [
                                  for (int i = 0;
                                      i <
                                          DateTime(now.year, now.month + 1, 0)
                                              .day;
                                      i++)
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          (i + 1).toString().padLeft(2, '0'),
                                          style: i == currentDay
                                              ? const TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: CustomColor.black2,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              : (i - currentDay).abs() == 1
                                                  ? const TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: CustomColor.gray,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )
                                                  : const TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: CustomColor
                                                          .lightGray3,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                        )),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(
                                left: 4,
                              ),
                              child: Text(
                                '일',
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  color: CustomColor.black2,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ]),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      fixedSize: const Size(212, 45),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: CustomColor.lightGray3.withOpacity(0.9),
                      textStyle: const TextStyle(
                        fontSize: 13,
                        color: CustomColor.black2,
                      ),
                    ),
                    onPressed: () {
                      widget.onSave(DateTime(
                        now.year + currentYear,
                        currentMonth + 1,
                        currentDay + 1,
                        widget.scheduleTime.hour,
                        widget.scheduleTime.minute,
                      ));
                      widget.handleClose();
                    },
                    child: const Center(
                      child: Text(
                        '저장',
                        style: TextStyle(
                          fontSize: 14,
                          color: CustomColor.black2,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
