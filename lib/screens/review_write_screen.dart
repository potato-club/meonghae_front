import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/review_category_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/review_write_screen/write_form_widget.dart';

class ReviewWriteScreen extends StatefulWidget {
  const ReviewWriteScreen({super.key});

  @override
  State<ReviewWriteScreen> createState() => _ReviewWriteScreenState();
}

class _ReviewWriteScreenState extends State<ReviewWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        CustomWarningModalWidget.show(
            '페이지를 나가시겠어요?', '지금까지 작성했던 내용들은\n지워지게 되므로 유의해주세요', () {
          Get.back();
          Get.find<ReviewController>().clear();
        });
        return true;
      },
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: Stack(
            children: [
              SafeArea(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 144),
                    const ReviewCategoryWidget(),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 14, 0, 40),
                      child: WriteFormWidget(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.06),
                      child: InkWell(
                        onTap: () => Get.find<ReviewController>().writeReview(),
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
                    ),
                    const SizedBox(height: 60),
                  ],
                ),
              )),
              const Positioned(
                top: 0,
                child: StarRatingWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
