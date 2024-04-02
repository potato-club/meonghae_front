import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
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
      onWillPop: () async => Get.find<ReviewController>().willPop(),
      child: Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: GetX<ReviewController>(builder: (controller) {
            return Stack(
              children: [
                SafeArea(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 144),
                      const ReviewCategoryWidget(),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 28, 0, 40),
                        child: WriteFormWidget(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.06),
                        child: InkWell(
                          onTap: () => controller.writeReview(),
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: CustomColor.brown1),
                            child: const Center(
                              child: Text("리뷰 등록하기",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: CustomColor.white,
                                  )),
                            ),
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
                ),
                if (controller.isWriting.value)
                  const Positioned(
                      child: Center(
                    child: LoadingDotWidget(color: CustomColor.brown1),
                  )),
              ],
            );
          }),
        ),
      ),
    );
  }
}
