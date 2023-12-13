import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';

class ScheduleContentWidget extends StatefulWidget {
  const ScheduleContentWidget({super.key});

  @override
  State<ScheduleContentWidget> createState() => _ScheduleContentWidgetState();
}

class _ScheduleContentWidgetState extends State<ScheduleContentWidget> {
  List<dynamic> preview = [];

  @override
  void initState() {
    getPreview();
    super.initState();
  }

  Future<void> getPreview() async {
    SendAPI.get(
      url: "/profile-service/profile/calendar/preview",
      successFunc: (data) {
        setState(() => preview = data.data);
        print(data.data);
      },
      errorMsg: "일정 미리보기 정보 호출에 실패하였어요",
    );
  }

  Widget createPostItem(
      {required String time,
      required String content,
      required String name,
      required bool isEndItem}) {
    var dateTime = DateTime.parse(time);
    var difference = DateTime.now().difference(dateTime).inDays;

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
                    'D-$difference',
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
              label: "일정", routingPath: AppRoutes.calendar),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 624,
          child: Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    if (preview.isEmpty)
                      SizedBox(
                        height: MediaQuery.of(context).size.height - 660,
                        child: const Center(
                          child: Text(
                            '아직 일정이 없네요',
                            style: TextStyle(
                                fontSize: 13, color: CustomColor.lightGray2),
                          ),
                        ),
                      ),
                    for (int i = 0; i < preview.length; i++)
                      createPostItem(
                          time: preview[i]['scheduleDate'],
                          content: preview[i]['scheduleText'] ?? '',
                          name: preview[i]['petName'],
                          isEndItem: i + 1 == preview.length),
                    const SizedBox(height: 20),
                  ],
                ),
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
            Positioned(
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                      CustomColor.white,
                      CustomColor.white.withOpacity(0),
                    ])),
                height: 20,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ]),
        )
      ],
    );
  }
}
