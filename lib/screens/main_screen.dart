import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/user/user_info.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/main_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/main_screen/main_content_widget.dart';
import 'package:meonghae_front/widgets/main_screen/my_dog_scroll_widget.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic>? dogsInfo;
  @override
  void initState() {
    _saveUserInfo();
    _getDogsInfo();
    super.initState();
  }

  Future<void> _saveUserInfo() async {
    var userEmail = await readUserEmail();
    if (userEmail == null) {
      var token = await readAccessToken();
      try {
        Dio dio = Dio();
        var token = await readAccessToken();
        dio.options.headers['Authorization'] = token;
        final response = await dio.get('${baseUrl}user-service/mypage');
        if (response.statusCode == 200) {
          saveUserInfo(response.data);
        } else {
          SnackBarWidget.show(context, SnackBarType.error, "유저정보 호출에 실패하였습니다");
        }
      } catch (error) {
        SnackBarWidget.show(context, SnackBarType.error, error.toString());
      }
    }
  }

  Future<void> _getDogsInfo() async {
    try {
      Dio dio = Dio();
      var token = await readAccessToken();
      dio.options.headers['Authorization'] = token;
      final response = await dio.get('${baseUrl}profile-service/profile');
      if (response.statusCode == 200) {
        dogsInfo = await response.data;
        setState(() {});
        print(dogsInfo);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "애완동물정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.06,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Transform.translate(
                            offset: const Offset(0, 8),
                            child: const Image(
                              image: AssetImage(
                                  'assets/images/logo/meonghae_logo.png'),
                              width: 68,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 24, bottom: 32),
                            child: BannerWidget(),
                          )
                        ])),
                MyDogScrollWidget(dogsInfo: dogsInfo),
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            child: MainContentWidget(),
          ),
          const Positioned(bottom: 0, child: UnderBarWidget(currentScreen: '홈'))
        ]),
      ),
    );
  }
}
