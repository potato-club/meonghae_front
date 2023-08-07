import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/screens/calendar_screen.dart';
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
      successFunc: (data) => setState(() => preview = data.data),
      errorMsg: "일정 미리보기 정보 호출에 실패하였습니다",
    );
  }

  Widget createPostItem(
      String time, String content, String userName, bool isEndItem) {
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
            SizedBox(
              width: 32,
              child: Text(
                'D-$difference',
                style: const TextStyle(fontSize: 13),
              ),
            ),
            Text(
              content,
              style: const TextStyle(fontSize: 12),
            ),
            Text(
              userName,
              style: const TextStyle(fontSize: 12),
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
              label: "일정", routingScreen: CalendarScreen()),
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
                    for (int i = 0; i < preview.length; i++)
                      createPostItem(
                          preview[i]['scheduleTime'],
                          preview[i]['text'],
                          preview[i]['petName'],
                          i + 1 == preview.length),
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
