import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_write_screen/images_widget.dart';
import 'package:meonghae_front/widgets/svg/clip.dart';

class WriteFormWidget extends StatefulWidget {
  const WriteFormWidget({super.key});

  @override
  State<WriteFormWidget> createState() => _WriteFormWidgetState();
}

class _WriteFormWidgetState extends State<WriteFormWidget> {
  @override
  Widget build(BuildContext context) {
    late String title;
    late String content;
    File? imageFile;
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    title = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "제목을 입력해주세요",
                  hintStyle:
                      const TextStyle(fontSize: 12, color: CustomColor.gray),
                  border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: CustomColor.gray),
                      borderRadius: BorderRadius.circular(10)),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: CustomColor.gray),
                      borderRadius: BorderRadius.circular(10)),
                  errorBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: CustomColor.gray),
                      borderRadius: BorderRadius.circular(10)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                ),
                style: const TextStyle(fontSize: 12, color: CustomColor.black2),
                maxLines: 1,
              ),
            ),
            const SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColor.gray, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              height: 202,
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    content = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "내용을 입력해주세요",
                  hintStyle:
                      const TextStyle(fontSize: 12, color: CustomColor.gray),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                maxLines: 16,
                style: const TextStyle(fontSize: 12, color: CustomColor.black2),
              ),
            ),
            SizedBox(height: 14),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: CustomColor.gray, width: 1),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding:
                    EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Text("포토",
                            style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w700,
                                color: CustomColor.black2)),
                        SizedBox(width: 4),
                        ClipSVG()
                      ],
                    ),
                    SizedBox(height: 12),
                    ImagesWidget(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
