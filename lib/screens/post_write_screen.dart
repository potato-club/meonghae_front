import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
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
      try {
        Dio dio = Dio();
        var token = await readAccessToken();
        dio.options.headers['Authorization'] = token;
        FormData formData = FormData.fromMap({
          "title": writeData["title"],
          "content": writeData["content"],
          if (writeData["images"].length != 0)
            "images": [
              for (File image in writeData["images"])
                await MultipartFile.fromFile(image.path)
            ]
        });
        final response = await dio.post(
            '${baseUrl}community-service/boards/${writeData['type']}',
            data: formData);
        if (response.statusCode == 201) {
          Navigator.pop(context);
          SnackBarWidget.show(
              context, SnackBarType.check, '성공적으로 게시글을 작성하였습니다');
        } else {
          SnackBarWidget.show(context, SnackBarType.error, '게시글 작성에 실패하였습니다');
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
