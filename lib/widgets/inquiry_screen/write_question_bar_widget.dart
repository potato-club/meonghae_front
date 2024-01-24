import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/inquiry_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/send.dart';

class WriteQuestionBarWidget extends StatefulWidget {
  const WriteQuestionBarWidget({super.key});

  @override
  State<WriteQuestionBarWidget> createState() => _WriteQuestionBarWidgetState();
}

class _WriteQuestionBarWidgetState extends State<WriteQuestionBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.06, vertical: 20),
      child: Container(
        decoration: BoxDecoration(
            color: CustomColor.white, borderRadius: BorderRadius.circular(10)),
        height: 44,
        child: Stack(children: [
          TextFormField(
            controller: Get.find<InquiryController>().textController,
            decoration: const InputDecoration(
              hintText: '문의내용 입력하기',
              alignLabelWithHint: true,
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.only(left: 16, right: 45),
              hintStyle: TextStyle(
                color: CustomColor.gray,
                fontSize: 14,
              ),
              errorStyle: TextStyle(fontSize: 0, color: Colors.transparent),
            ),
            style: const TextStyle(fontSize: 14),
            keyboardType: TextInputType.text,
          ),
          Positioned(
            right: 0,
            child: InkWell(
              onTap: () {
                Get.find<InquiryController>().generateAnswer();
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const SizedBox(
                height: 44,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  child: SendSVG(strokeColor: CustomColor.lightGray2),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
