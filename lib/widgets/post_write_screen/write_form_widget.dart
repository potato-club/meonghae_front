import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_write_screen/category_form_widget.dart';
import 'package:meonghae_front/widgets/post_write_screen/images_form_widget.dart';

class WriteFormWidget extends StatefulWidget {
  final Map<String, dynamic> writeData;
  final Function setWriteData;
  const WriteFormWidget({
    super.key,
    required this.writeData,
    required this.setWriteData,
  });

  @override
  State<WriteFormWidget> createState() => _WriteFormWidgetState();
}

class _WriteFormWidgetState extends State<WriteFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: CustomColor.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Container(
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                color: CustomColor.lightGray1,
                width: 1.0,
              ))),
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: TextField(
                // onChanged: (value) => widget.setWriteData("title", value),
                decoration: InputDecoration(
                  hintText: "제목",
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    color: CustomColor.gray,
                    fontWeight: FontWeight.bold,
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  contentPadding: EdgeInsets.only(
                    top: 20,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 16,
                  color: CustomColor.black2,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                onChanged: (value) => widget.setWriteData("title", value),
              ),
            ),
          ),
          CategoryFormWidget(
            writeData: widget.writeData,
            setWriteData: widget.setWriteData,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - 320,
            child: TextField(
              // onChanged: (value) => widget.setWriteData("title", value),
              decoration: InputDecoration(
                hintText: "내용을 입력해주세요",
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: CustomColor.gray,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: MediaQuery.of(context).size.width * 0.06,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
                color: CustomColor.black2,
              ),
              maxLines: 1,
              onChanged: (value) => widget.setWriteData("content", value),
            ),
          ),
          SizedBox(
            height: 104,
            child: Align(
              alignment: Alignment.topLeft,
              child: ImagesFormWidget(
                writeData: widget.writeData,
                setWriteData: widget.setWriteData,
              ),
            ),
          )
        ],
      ),
    );
  }
}
