import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
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
  final Function setWriteData;
  final Map<String, dynamic> writeData;
  const ReviewCategoryWidget(
      {super.key, required this.setWriteData, required this.writeData});

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
  CarouselController _carouselController = CarouselController();
  void moveSlide(int index) {
    _carouselController.animateToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    List<Category> reviewCategory = [
      Category(
          NeckCollarSVG(
            color1: widget.writeData['type'] == 1
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 1
                ? CustomColor.lightGray3
                : CustomColor.lightGray3,
          ),
          '넥카라',
          1),
      Category(
          SnoodSVG(
            color1: widget.writeData['type'] == 2
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 2
                ? CustomColor.lightGray3
                : CustomColor.lightGray3,
          ),
          '목줄',
          2),
      Category(
          ToySVG(
            color1: widget.writeData['type'] == 3
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 3
                ? CustomColor.brown1
                : CustomColor.lightGray3,
          ),
          '장난감',
          3),
      Category(
          CushionSVG(
            color1: widget.writeData['type'] == 4
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 4
                ? CustomColor.white
                : CustomColor.lightGray3,
          ),
          '방석',
          4),
      Category(
          WasherSVG(
            color1: widget.writeData['type'] == 5
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 5
                ? CustomColor.lightGray3
                : CustomColor.lightGray3,
          ),
          '목욕용품',
          5),
      Category(
          FeedSVG(
            color1: widget.writeData['type'] == 6
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 6
                ? CustomColor.white
                : CustomColor.lightGray3,
          ),
          '사료',
          6),
      Category(
          DogChewSVG(
            color1: widget.writeData['type'] == 7
                ? CustomColor.lightGray3
                : CustomColor.black4,
            color2: widget.writeData['type'] == 7
                ? CustomColor.brown1
                : CustomColor.lightGray3,
          ),
          '강아지껌',
          7),
      Category(
          MuzzleSVG(
            color1: widget.writeData['type'] == 8
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 8
                ? CustomColor.lightGray3
                : CustomColor.lightGray3,
          ),
          '입마개',
          8),
      Category(
          StrollerSVG(
            color1: widget.writeData['type'] == 9
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 9
                ? CustomColor.lightGray3
                : CustomColor.lightGray3,
          ),
          '유모차',
          9),
      Category(
          PadSVG(
            color1: widget.writeData['type'] == 10
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 10
                ? CustomColor.lightGray3
                : CustomColor.lightGray3,
          ),
          '배변패드',
          10),
      Category(
          SnackSVG(
            color1: widget.writeData['type'] == 11
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 11
                ? CustomColor.white
                : CustomColor.lightGray3,
          ),
          '간식',
          11),
      Category(
          BodySVG(
            color1: widget.writeData['type'] == 12
                ? CustomColor.brown1
                : CustomColor.black4,
            color2: widget.writeData['type'] == 12
                ? CustomColor.lightGray3
                : CustomColor.lightGray3,
          ),
          '바디용품',
          12),
    ];
    return Container(
        child: CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        height: 60,
        initialPage: 0,
        enableInfiniteScroll: true,
        aspectRatio: 1 / 1,
        viewportFraction: 0.2,
      ),
      items: reviewCategory.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return InkWell(
              onTap: () {
                widget.setWriteData('type', i.id);
                moveSlide(i.id - 1);
              },
              child: Column(
                children: [
                  i.svg,
                  SizedBox(height: 4),
                  Text(i.label,
                      style: TextStyle(
                          color: widget.writeData['type'] == i.id
                              ? CustomColor.brown1
                              : CustomColor.gray,
                          fontSize: 10)),
                ],
              ),
            );
          },
        );
      }).toList(),
    ));
  }
}
