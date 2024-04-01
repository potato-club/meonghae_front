import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class LoadingSpinnerWidget extends StatelessWidget {
  const LoadingSpinnerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: SizedBox(
      width: 44,
      height: 44,
      child: CircularProgressIndicator(
        color: CustomColor.brown1,
        strokeWidth: 6,
      ),
    ));
  }
}
