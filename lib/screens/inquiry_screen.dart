import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/inquiry_screen/Q_A_widget.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class InquiryScreen extends StatefulWidget {
  const InquiryScreen({super.key});

  @override
  State<InquiryScreen> createState() => _InquiryScreenState();
}

class _InquiryScreenState extends State<InquiryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.ivory2,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical:
                            MediaQuery.of(context).size.height * 0.04 + 20),
                    child: const Text(
                      'Q & A',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.88,
                            child: const SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 14, 20, 17),
                                    child: Text(
                                      '자주하는 질문',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  QAWidget(
                                      question: "자주하는 질문이 뭐가 있을까?",
                                      answer: "몰?루"),
                                  QAWidget(
                                      question: "탈퇴는 어떻게 하나요?", answer: "그러겡"),
                                  QAWidget(
                                      question: "반복적으로 앱이 중지됩니다",
                                      answer: "파이팅"),
                                  QAWidget(
                                      question: "게시판의 글이 보이지 않아요",
                                      answer: "내가 사라져볼게~뿅"),
                                  QAWidget(
                                      question: "강아지가 사람이 되었어요",
                                      answer: "사람 됐다 짱이지 이 손을 봐, 대박임"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(AppRoutes.inquiry1to1),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 20, right: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '문의하기',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                                height: 16,
                                child: PencilSVG(color: CustomColor.brown1))
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.055 + 74),
                ],
              ),
            ),
            const Positioned(
                bottom: 0, child: UnderBarWidget(currentScreen: '문의')),
          ],
        ),
      ),
    );
  }
}
