import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/screens/register_dog_screen.dart';
import 'package:meonghae_front/screens/video_player_screen.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_registered_photo_widget.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

import '../themes/customColor.dart';

class RegisteredUserScreen extends StatefulWidget {
  final bool hasAnimal;
  final File? imageFile;
  final Map<String, dynamic?> userInfo;
  const RegisteredUserScreen(
      {super.key,
      required this.imageFile,
      required this.userInfo,
      required this.hasAnimal});

  @override
  State<RegisteredUserScreen> createState() => _RegisteredUserScreenState();
}

class _RegisteredUserScreenState extends State<RegisteredUserScreen> {
  Map<String, dynamic> json = {
    "nickname": "조금주",
    "birth": "20000625",
    "age": 1,
    "email": "rmawn3245@naver.com",
  };
  Future<void> handleNext() async {
    var file = await MultipartFile.fromFile(widget.imageFile!.path);
    Dio dio = Dio();
    dio.options.contentType = 'multipart/form-data';
    FormData formData = FormData();
    formData.fields.add(
      MapEntry(
        'userDto',
        '{ "nickname": "조금주", "birth": "20000625", "age": 4, "email": "rmawn3245@naver.com" }',
      ),
    );
    formData.files.add(
      MapEntry(
        'file',
        await MultipartFile.fromFile(widget.imageFile!.path),
      ),
    );

    try {
      final response = await dio.post(
        '${baseUrl}user-service/signup',
        data: formData,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("######HEADER:${response.headers}");
        print("######BODY:${response.data}");
        saveAccessToken(response.headers['authorization']![0]);
        saveRefreshToken(response.headers['refreshtoken']![0]);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => widget.hasAnimal
                    ? RegisterDogScreen()
                    : VideoPlayerScreen()),
            (Route<dynamic> route) => false);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, '유저정보 등록에 실패하였습니다');
      }
    } catch (error) {
      print(error);
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColor.brown1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          UserRegisteredPhotoWidget(imageFile: widget.imageFile),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.125,
          ),
          Column(
            children: [
              const Text(
                '안녕하세요',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Text(
                '${widget.userInfo['nickname']} 님!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '수정하기',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.white,
                      ),
                    ),
                    SizedBox(width: 6),
                    TinyRightArrowSVG(
                      color: CustomColor.white,
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.145),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(288, 49),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: CustomColor.black2,
              ),
              onPressed: handleNext,
              child: const Text(
                '다음',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
