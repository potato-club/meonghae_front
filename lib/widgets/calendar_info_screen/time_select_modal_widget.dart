import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class TimeSelectModalWidget extends StatefulWidget {
  final DateTime scheduleTime;
  final Function onSave;
  final Function handleClose;
  const TimeSelectModalWidget({
    super.key,
    required this.onSave,
    required this.handleClose,
    required this.scheduleTime,
  });

  @override
  State<TimeSelectModalWidget> createState() => _TimeSelectModalWidgetState();
}

DateTime now = DateTime.now();

class _TimeSelectModalWidgetState extends State<TimeSelectModalWidget> {
  int currentAa = 0;
  int currentHour = 0;
  int currentMinute = 0;

  @override
  void initState() {
    currentHour = widget.scheduleTime.hour >= 12
        ? widget.scheduleTime.hour - 12
        : widget.scheduleTime.hour;
    currentMinute = widget.scheduleTime.minute;
    currentAa = (widget.scheduleTime.hour >= 12) ? 1 : 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(currentMinute);
    const aa = ['오전', '오후'];
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
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 26,
                                child: CarouselSlider(
                                    options: CarouselOptions(
                                      height: 148,
                                      scrollDirection: Axis.vertical,
                                      initialPage: currentAa,
                                      viewportFraction: 0.2,
                                      enableInfiniteScroll: false,
                                      onPageChanged: (index, reason) =>
                                          setState(() => currentAa = index),
                                    ),
                                    items: [
                                      for (int i = 0; i < aa.length; i++)
                                        Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              aa[i],
                                              style: i == currentAa
                                                  ? const TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: CustomColor.black2,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )
                                                  : const TextStyle(
                                                      decoration:
                                                          TextDecoration.none,
                                                      color: CustomColor.gray,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                            )),
                                    ])),
                            const SizedBox(width: 36),
                            SizedBox(
                              width: 17,
                              child: CarouselSlider(
                                  options: CarouselOptions(
                                    height: 148,
                                    initialPage: widget.scheduleTime.hour,
                                    scrollDirection: Axis.vertical,
                                    viewportFraction: 0.2,
                                    enableInfiniteScroll: true,
                                    onPageChanged: (index, reason) =>
                                        setState(() => currentHour = index),
                                  ),
                                  items: [
                                    for (int i = 0; i < 12; i++)
                                      Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            (i == 0 ? 12 : i)
                                                .toString()
                                                .padLeft(2, '0'),
                                            style: i == currentHour
                                                ? const TextStyle(
                                                    decoration:
                                                        TextDecoration.none,
                                                    color: CustomColor.black2,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                : ((i - currentHour).abs() ==
                                                            1 ||
                                                        (i - currentHour)
                                                                .abs() ==
                                                            11)
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
                                right: 26,
                                left: 26,
                              ),
                              child: Text(
                                ':',
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
                                  initialPage: widget.scheduleTime.minute,
                                  scrollDirection: Axis.vertical,
                                  viewportFraction: 0.2,
                                  enableInfiniteScroll: true,
                                  onPageChanged: (index, reason) =>
                                      setState(() => currentMinute = index),
                                ),
                                items: [
                                  for (int i = 0; i < 60; i++)
                                    Align(
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          (i).toString().padLeft(2, '0'),
                                          style: i == currentMinute
                                              ? const TextStyle(
                                                  decoration:
                                                      TextDecoration.none,
                                                  color: CustomColor.black2,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                )
                                              : ((i - currentMinute).abs() ==
                                                          1 ||
                                                      (i - currentMinute)
                                                              .abs() ==
                                                          59)
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
                        widget.scheduleTime.year,
                        widget.scheduleTime.month,
                        widget.scheduleTime.day,
                        currentHour + (currentAa * 12),
                        currentMinute,
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
