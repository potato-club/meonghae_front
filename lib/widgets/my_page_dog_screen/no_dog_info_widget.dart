import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class NoDogInfoWidget extends StatelessWidget {
  const NoDogInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
              height: 65,
              child: Transform.translate(
                  offset: const Offset(0, 10),
                  child: Transform.scale(
                      scale: 2.0,
                      child: Image.asset(
                          'assets/images/dog_pictures/peek_dog.png')))),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Text(
            '아직 애완동물의 정보가 없어요...',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: CustomColor.white),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
