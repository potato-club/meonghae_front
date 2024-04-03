import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/review_menu/body.dart';
import 'package:meonghae_front/widgets/svg/review_menu/cushion.dart';
import 'package:meonghae_front/widgets/svg/review_menu/dog_chew.dart';
import 'package:meonghae_front/widgets/svg/review_menu/feed.dart';
import 'package:meonghae_front/widgets/svg/review_menu/muzzle.dart';
import 'package:meonghae_front/widgets/svg/review_menu/neck_collar.dart';
import 'package:meonghae_front/widgets/svg/review_menu/pad.dart';
import 'package:meonghae_front/widgets/svg/review_menu/snack.dart';
import 'package:meonghae_front/widgets/svg/review_menu/snood.dart';
import 'package:meonghae_front/widgets/svg/review_menu/stroller.dart';
import 'package:meonghae_front/widgets/svg/review_menu/toy.dart';
import 'package:meonghae_front/widgets/svg/review_menu/washer.dart';

class ReviewCategoryWidget extends StatefulWidget {
  const ReviewCategoryWidget({super.key});

  @override
  State<ReviewCategoryWidget> createState() => _ReviewCategoryWidgetState();
}

class Category {
  final Widget svg;
  final String label;
  final int id;
  Category(this.svg, this.label, this.id);
}

class _ReviewCategoryWidgetState extends State<ReviewCategoryWidget> {
  final CarouselController _carouselController = CarouselController();
  var type = Get.find<ReviewController>().writeType.value;
  void moveSlide(int index) {
    _carouselController.animateToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Category> reviewCategory = [
      Category(
          NeckCollarSVG(
            color1: type == 1 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 1 ? CustomColor.lightGray3 : CustomColor.lightGray3,
          ),
          '넥카라',
          1),
      Category(
          SnoodSVG(
            color1: type == 2 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 2 ? CustomColor.lightGray3 : CustomColor.lightGray3,
          ),
          '목줄',
          2),
      Category(
          ToySVG(
            color1: type == 3 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 3 ? CustomColor.brown1 : CustomColor.lightGray3,
          ),
          '장난감',
          3),
      Category(
          CushionSVG(
            color1: type == 4 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 4 ? CustomColor.white : CustomColor.lightGray3,
          ),
          '방석',
          4),
      Category(
          WasherSVG(
            color1: type == 5 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 5 ? CustomColor.lightGray3 : CustomColor.lightGray3,
          ),
          '목욕용품',
          5),
      Category(
          FeedSVG(
            color1: type == 6 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 6 ? CustomColor.white : CustomColor.lightGray3,
          ),
          '사료',
          6),
      Category(
          DogChewSVG(
            color1: type == 7 ? CustomColor.lightGray3 : CustomColor.black4,
            color2: type == 7 ? CustomColor.brown1 : CustomColor.lightGray3,
          ),
          '강아지껌',
          7),
      Category(
          MuzzleSVG(
            color1: type == 8 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 8 ? CustomColor.lightGray3 : CustomColor.lightGray3,
          ),
          '입마개',
          8),
      Category(
          StrollerSVG(
            color1: type == 9 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 9 ? CustomColor.lightGray3 : CustomColor.lightGray3,
          ),
          '유모차',
          9),
      Category(
          PadSVG(
            color1: type == 10 ? CustomColor.brown1 : CustomColor.black4,
            color2:
                type == 10 ? CustomColor.lightGray3 : CustomColor.lightGray3,
          ),
          '배변패드',
          10),
      Category(
          SnackSVG(
            color1: type == 11 ? CustomColor.brown1 : CustomColor.black4,
            color2: type == 11 ? CustomColor.white : CustomColor.lightGray3,
          ),
          '간식',
          11),
      Category(
          BodySVG(
            color1: type == 12 ? CustomColor.brown1 : CustomColor.black4,
            color2:
                type == 12 ? CustomColor.lightGray3 : CustomColor.lightGray3,
          ),
          '바디용품',
          12),
    ];
    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        height: 62,
        initialPage: Get.find<ReviewController>().writeType.value - 1,
        enableInfiniteScroll: true,
        aspectRatio: 1 / 1,
        viewportFraction: 0.2,
      ),
      items: reviewCategory.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return GetX<ReviewController>(builder: (controller) {
              return InkWell(
                onTap: () {
                  controller.writeType(i.id);
                  moveSlide(i.id - 1);
                  setState(() => type = i.id);
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Column(
                  children: [
                    i.svg,
                    const SizedBox(height: 4),
                    Text(i.label,
                        style: TextStyle(
                            color: controller.writeType.value == i.id
                                ? CustomColor.brown1
                                : CustomColor.gray,
                            fontSize: 10)),
                  ],
                ),
              );
            });
          },
        );
      }).toList(),
    );
  }
}
