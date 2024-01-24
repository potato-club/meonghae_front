import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/inquiry_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/inquiry_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/inquiry_screen/bubble_widget.dart';
import 'package:meonghae_front/widgets/inquiry_screen/write_question_bar_widget.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  @override
  void initState() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      Get.find<InquiryController>().setScrollDown();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivory2,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                const BannerWidget(),
                Flexible(
                    child: Stack(
                  children: [
                    SingleChildScrollView(
                      controller:
                          Get.find<InquiryController>().scrollController,
                      padding: const EdgeInsets.only(top: 24, bottom: 140),
                      dragStartBehavior: DragStartBehavior.down,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06),
                        child: GetX<InquiryController>(builder: (controller) {
                          return Column(
                            children: [
                              const BubbleWidget(
                                  isAnswer: true,
                                  needMail: false,
                                  text: '안녕하세요 1대1 채팅문의 입니다.\n무엇을 도와드릴까요?'),
                              ...controller.dialog.value.map((i) =>
                                  BubbleWidget(
                                      isAnswer: i["isAnswer"],
                                      needMail: i["needMail"],
                                      text: i["text"])),
                            ],
                          );
                        }),
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
                        height: 32,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  ],
                ))
              ],
            ),
            Positioned(
                width: MediaQuery.of(context).size.width,
                bottom: 74,
                child: WriteQuestionBarWidget()),
            const Positioned(
                bottom: 0, child: UnderBarWidget(currentScreen: '문의')),
          ],
        ),
      ),
    );
  }
}
