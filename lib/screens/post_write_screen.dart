import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/post_write_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/post_write_screen/write_form_widget.dart';

class PostWriteScreen extends StatefulWidget {
  const PostWriteScreen({super.key});

  @override
  State<PostWriteScreen> createState() => _PostWriteScreenState();
}

class _PostWriteScreenState extends State<PostWriteScreen> {
  Map<String, dynamic> writeData = {
    "title": "",
    "content": "",
    "images": [],
    'type': null
  };
  void setWriteData(String key, dynamic value) {
    setState(() => writeData[key] = value);
  }

  Future<void> handleSubmit() async {
    if (writeData["title"] != "" &&
        writeData["content"] != "" &&
        writeData["type"] != null) {
      dio.FormData formData = dio.FormData.fromMap({
        "title": writeData["title"],
        "content": writeData["content"],
        if (writeData["images"].length != 0)
          "images": [
            for (File image in writeData["images"])
              await dio.MultipartFile.fromFile(image.path)
          ]
      });
      SendAPI.post(
        url: "/community-service/boards/${writeData['type']}",
        request: formData,
        successCode: 201,
        successFunc: (data) {
          Navigator.pop(context);
          Get.find<PostController>().reload();
          SnackBarWidget.show(SnackBarType.check, '성공적으로 게시글을 작성하였습니다');
        },
        errorMsg: "게시글 작성에 실패하였습니다",
      );
    } else {
      SnackBarWidget.show(SnackBarType.error, "모든 정보를 입력해주세요");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.white,
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100),
                WriteFormWidget(
                    writeData: writeData, setWriteData: setWriteData),
              ],
            ),
          ),
          Positioned(child: BannerWidget(handleSubmit: handleSubmit)),
        ]));
  }
}
