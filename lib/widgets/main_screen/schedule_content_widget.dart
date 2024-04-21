import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/home_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';

class ScheduleContentWidget extends StatefulWidget {
  const ScheduleContentWidget({super.key});

  @override
  State<ScheduleContentWidget> createState() => _ScheduleContentWidgetState();
}

class _ScheduleContentWidgetState extends State<ScheduleContentWidget> {
  Widget createPostItem(
      {required String time,
      required String content,
      required String name,
      required int index,
      required bool isEndItem}) {
    var dateTime = DateTime.parse(time);
    var now = DateTime.now();
    var difference = DateTime(dateTime.year, dateTime.month, dateTime.day)
        .difference(DateTime(now.year, now.month, now.day))
        .inDays;

    return Container(
      decoration: BoxDecoration(
        border: isEndItem
            ? null
            : const Border(
                bottom: BorderSide(
                  color: CustomColor.lightGray1,
                  width: 1,
                ),
              ),
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 6, bottom: isEndItem ? 0 : 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 72,
                  child: Text(
                    'D - $difference',
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.88 - 130,
                  child: Text(
                    content,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                decoration: BoxDecoration(
                  color: index % 2 == 0
                      ? CustomColor.brown1
                      : CustomColor.brown1.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(6),
                  border: index % 2 == 0
                      ? null
                      : Border.all(width: 1, color: CustomColor.brown1),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: index % 2 == 0 ? 4 : 3,
                      horizontal: index % 2 == 0 ? 6 : 5),
                  child: Text(
                    name,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 11),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.06),
          child: const MainContentLabelWidget(
            label: "일정",
            navyIndex: 0,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 624,
          child: Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: GetX<HomeController>(builder: (controller) {
                  if (controller.isScheduleLoading.value) {
                    return SizedBox(
                      height: MediaQuery.of(context).size.height - 611,
                      child: const Center(
                          child: LoadingDotWidget(
                        color: CustomColor.brown1,
                        size: 30.0,
                      )),
                    );
                  } else {
                    if (controller.schedulePreview.isEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height - 611,
                        child: const Center(
                          child: Text(
                            '아직 일정이 없어요',
                            style: TextStyle(
                                fontSize: 12, color: CustomColor.lightGray2),
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          const SizedBox(height: 8),
                          for (int i = 0;
                              i < controller.schedulePreview.length;
                              i++)
                            createPostItem(
                                time:
                                    controller.schedulePreview[i].scheduleDate,
                                content: controller
                                        .schedulePreview[i].scheduleTitle ??
                                    '',
                                name: controller.schedulePreview[i].petName,
                                index: i,
                                isEndItem:
                                    i + 1 == controller.schedulePreview.length),
                          const SizedBox(height: 20),
                        ],
                      );
                    }
                  }
                }),
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      CustomColor.white,
                      CustomColor.white.withOpacity(0),
                    ])),
                height: 8,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
