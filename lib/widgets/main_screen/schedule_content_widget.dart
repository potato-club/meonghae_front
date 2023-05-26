import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_label_widget.dart';

class ScheduleContentWidget extends StatelessWidget {
  const ScheduleContentWidget({super.key});

  Widget createPostItem(
      num dday, String content, String userName, bool isEndItem) {
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
                'D-$dday',
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
          child: const MainContentLabelWidget(label: "일정"),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: MediaQuery.of(context).size.height - 640,
          child: Stack(children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.06),
                child: Column(
                  children: [
                    const SizedBox(height: 8),
                    createPostItem(8, '1차 예방접종', '흥이1', false),
                    createPostItem(22, '2차 예방접종', '흥이2', false),
                    createPostItem(24, '3차 예방접종', '흥이3', false),
                    createPostItem(36, '4차 예방접종', '흥이4', true),
                    createPostItem(8, '1차 예방접종', '흥이1', false),
                    createPostItem(22, '2차 예방접종', '흥이2', false),
                    createPostItem(24, '3차 예방접종', '흥이3', false),
                    createPostItem(36, '4차 예방접종', '흥이4', true),
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
