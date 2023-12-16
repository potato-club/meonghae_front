import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/star.dart';

class StarRatingWidget extends StatefulWidget {
  const StarRatingWidget({super.key});

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.white,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.035,
            36, MediaQuery.of(context).size.width * 0.035, 22),
        child: Stack(children: [
          Center(
            child: Column(
              children: [
                const Text('상품은 어떠셨나요?',
                    style: TextStyle(
                      fontSize: 16,
                      color: CustomColor.black2,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(height: 16),
                GetX<ReviewController>(builder: (controller) {
                  return RatingStars(
                    value: controller.rate.value,
                    onValueChanged: (v) => controller.setRate(v),
                    starBuilder: (index, color) => StarSVG(color: color),
                    starCount: 5,
                    starSize: 40,
                    maxValue: 5,
                    starSpacing: 2,
                    maxValueVisibility: false,
                    valueLabelVisibility: false,
                    animationDuration: const Duration(milliseconds: 600),
                    starOffColor: CustomColor.lightGray3,
                    starColor: CustomColor.brown1,
                  );
                })
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: InkWell(
              onTap: () => Get.find<ReviewController>().willPop(),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const SizedBox(
                  width: 34,
                  child: Align(
                      alignment: Alignment.center,
                      child: ArrowSVG(strokeColor: CustomColor.black2))),
            ),
          )
        ]),
      ),
    );
  }
}
