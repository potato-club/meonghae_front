import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/star.dart';

class StarRatingWidget extends StatefulWidget {
  final Function setWriteData;
  final Map<String, dynamic> writeData;
  const StarRatingWidget(
      {super.key, required this.setWriteData, required this.writeData});

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.035),
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
              RatingStars(
                value: widget.writeData["rating"],
                onValueChanged: (v) => widget.setWriteData("rating", v),
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
              )
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const SizedBox(
                width: 34,
                child: Align(
                    alignment: Alignment.center,
                    child: ArrowSVG(strokeColor: CustomColor.black2))),
          ),
        )
      ]),
    );
  }
}
