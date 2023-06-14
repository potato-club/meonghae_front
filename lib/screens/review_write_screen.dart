import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/write_form_widget.dart';

class ReviewWriteScreen extends StatefulWidget {
  const ReviewWriteScreen({super.key});

  @override
  State<ReviewWriteScreen> createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  Map<String, dynamic> writeData = {
    "title": "",
    "content": "",
    "rating": 0.0,
    "type": 3,
    "images": []
  };

  void setWriteData(String key, dynamic value) {
    setState(() => writeData[key] = value);
    print(writeData);
  }

  Future<void> handleSubmit() async {
    print(writeData);
    if (writeData["title"] != "" &&
        writeData["content"] != "" &&
        writeData["rating"] != 0 &&
        writeData["type"] != null) {
      try {
        Dio dio = Dio();
        var token = await readAccessToken();
        dio.options.headers['Authorization'] = token;
        FormData formData = FormData.fromMap({
          "title": writeData["title"],
          "content": writeData["content"],
          "rating": writeData["rating"].toInt(),
          "type": writeData["type"],
          if (writeData["images"].length != 0)
            "images": [
              for (File image in writeData["images"])
                await MultipartFile.fromFile(image.path)
            ]
        });
        final response = await dio.post('${baseUrl}community-service/reviews',
            data: formData);
        if (response.statusCode == 200) {
          Navigator.pop(context);
          SnackBarWidget.show(context, SnackBarType.check, '성공적으로 리뷰를 작성하였습니다');
        } else {
          SnackBarWidget.show(context, SnackBarType.error, '리뷰 작성에 실패하였습니다');
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
      backgroundColor: CustomColor.white,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 36),
            StarRatingWidget(setWriteData: setWriteData, writeData: writeData),
            const SizedBox(height: 28),
            WriteFormWidget(setWriteData: setWriteData, writeData: writeData),
            const SizedBox(height: 38),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: InkWell(
                onTap: handleSubmit,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColor.brown1),
                  child: const Expanded(
                      child: Center(
                    child: Text("리뷰 등록하기",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.white,
                        )),
                  )),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
