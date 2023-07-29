import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/review_category_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/write_form_widget.dart';

class ReviewWriteScreen extends StatefulWidget {
  final Function fetchData;
  const ReviewWriteScreen({super.key, required this.fetchData});

  @override
  State<ReviewWriteScreen> createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  Map<String, dynamic> writeData = {
    "title": "",
    "content": "",
    "rating": 0.0,
    "type": null,
    "images": []
  };

  void setWriteData(String key, dynamic value) {
    setState(() => writeData[key] = value);
  }

  Future<void> handleSubmit() async {
    if (writeData["title"] != "" &&
        writeData["content"] != "" &&
        writeData["rating"] != 0 &&
        writeData["type"] != null) {
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
      SendAPI.post(
        url: "/community-service/reviews",
        request: formData,
        successFunc: (data) {
          widget.fetchData();
          Navigator.pop(context);
          SnackBarWidget.show(SnackBarType.check, '성공적으로 리뷰를 작성하였습니다');
        },
        errorMsg: '리뷰 작성에 실패하였습니다',
      );
    } else {
      SnackBarWidget.show(SnackBarType.error, "모든 정보를 입력해주세요");
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
            const SizedBox(height: 36),
            ReviewCategoryWidget(
                setWriteData: setWriteData, writeData: writeData),
            const SizedBox(height: 14),
            WriteFormWidget(setWriteData: setWriteData, writeData: writeData),
            const SizedBox(height: 38),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: InkWell(
                onTap: handleSubmit,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
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
