import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DogPictureSwiper extends StatelessWidget {
  const DogPictureSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
          options: CarouselOptions(
            height: 240,
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
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -8),
                  child: Image.asset(
                    'assets/images/dog_pictures/stand_dog.png',
                    width: 200,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 32),
                const Text(
                  '멍멍아, 멍해?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Transform.translate(
                  offset: const Offset(0, -8),
                  child: Image.asset(
                    'assets/images/dog_pictures/lay_dog.png',
                    width: 180,
                  ),
                ),
              ],
            ),
          ]),
    );
  }
}
