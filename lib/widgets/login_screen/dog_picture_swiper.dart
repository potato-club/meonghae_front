import 'package:flutter/material.dart';

class DogPictureSwiper extends StatelessWidget {
  const DogPictureSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            offset: const Offset(0, -15),
            child: Image.asset(
              'assets/images/dog_pictures/stand_dog.png',
              width: 225,
              height: 210,
            ),
          ),
        ],
      ),
    );
  }
}
