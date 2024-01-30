import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/home_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';

class ScheduleContentWidget extends StatefulWidget {
  const ScheduleContentWidget({super.key});

  @override
  State<ScheduleContentWidget> createState() => _ScheduleContentWidgetState();
}

class _ScheduleContentWidgetState extends State<ScheduleContentWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeController>().getSchedulePreview();
    });
    super.initState();
  }

  Widget createPostItem(
      {required String time,
      required String content,
      required String name,
      required bool isEndItem}) {
    var dateTime = DateTime.parse(time);
    var difference = dateTime.difference(DateTime.now()).inDays + 1;

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
                    style: const TextStyle(fontSize: 13),
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
            SizedBox(
              width: 54,
              child: Text(
                name,
                textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 12),
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
          height: MediaQuery.of(context).size.height - 611,
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
                                fontSize: 13, color: CustomColor.lightGray2),
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
                                        .schedulePreview[i].scheduleText ??
                                    '',
                                name: controller.schedulePreview[i].petName,
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
