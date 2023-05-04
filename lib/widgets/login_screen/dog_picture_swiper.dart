import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:meonghae_front/themes/customColor.dart';

class DogPictureSwiper extends StatelessWidget {
  const DogPictureSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220,
        initialPage: 0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1200),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
      items: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              '주인아, 멍해?',
              style: TextStyle(
                color: CustomColor.black1,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            Image.asset(
              'assets/images/dog_pictures/stand_dog.png',
              width: 200,
            ),
          ],
        ),
        Transform.translate(
          offset: const Offset(0, 28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '멍멍아, 멍해?',
                style: TextStyle(
                  color: CustomColor.black1,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Image.asset(
                'assets/images/dog_pictures/lay_dog.png',
                width: 180,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
