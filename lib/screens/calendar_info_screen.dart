import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/additional_info_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/filter_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/top_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class CalendarInfoScreen extends StatefulWidget {
  const CalendarInfoScreen({super.key});

  @override
  State<CalendarInfoScreen> createState() => _CalendarInfoScreenState();
}

class _CalendarInfoScreenState extends State<CalendarInfoScreen> {
  String? content;
  bool isAllday = false;
  Map<String, String?> time = {'date': null, 'time': null};

  void setContent(String? value) {
    setState(() => content = value);
  }

  void setIsAllday() {
    setState(() => isAllday = !isAllday);
  }

  void setTime(String key, String value) {
    setState(() => time[key] = value);
  }

  Future<void> handleSave() async {
    print(time);
    if (content != null &&
        (isAllday || (time['date'] != null && time['time'] != null))) {
      try {
        Dio dio = Dio();
        var token = await readAccessToken();
        dio.options.headers['Authorization'] = token;
        final response =
            await dio.post('${baseUrl}profile-service/profile/calendar', data: {
          "petId": 43,
          "scheduleTime":
              isAllday ? "2023-06-14T00:00" : "${time['date']}T${time['time']}",
          "text": content
        });
        if (response.statusCode == 200) {
          Navigator.pop(context);
          SnackBarWidget.show(context, SnackBarType.check, "성공적으로 일정을 등록했습니다");
        } else {
          SnackBarWidget.show(context, SnackBarType.error, "일정 등록에 실패하였습니다");
        }
      } catch (error) {
        SnackBarWidget.show(context, SnackBarType.error, error.toString());
      }
    } else {
      SnackBarWidget.show(context, SnackBarType.error, "모든 정보를 입력해주세요");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivory2,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 32),
            TopMenuBarWidget(handleSave: handleSave),
            const SizedBox(height: 4),
            Expanded(
              child: Stack(children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.06),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 44,
                        ),
                        FilterWidget(setContent: setContent),
                        const SizedBox(
                          height: 24,
                        ),
                        AdditionalInfoWidget(
                            isAllday: isAllday,
                            setIsAllday: setIsAllday,
                            time: time,
                            setTime: setTime),
                        const SizedBox(
                          height: 60,
                        )
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
                          CustomColor.ivory2,
                          CustomColor.ivory2.withOpacity(0),
                        ])),
                    height: 36,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
