import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewSVG extends StatelessWidget {
  final bool isCurrent;
  const ReviewSVG({super.key, required this.isCurrent});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.string(
      '''
      <svg width="25" height="23" viewBox="0 0 25 23" fill="none" xmlns="http://www.w3.org/2000/svg">
      <path d="M12.5345 17.2151C12.6081 16.9536 12.7445 16.7147 12.9305 16.5212L19.5616 9.66126L19.5666 9.65611V1.77693C19.5666 0.983145 18.9387 0.333496 18.1715 0.333496H2.38483C1.61763 0.333496 0.989746 0.983145 0.989746 1.77693V18.1108C0.989746 18.9046 1.61763 19.5542 2.38483 19.5542H11.7733L12.5355 17.2151H12.5345Z" fill='${isCurrent ? '#F2CB80' : '#BDBDBD'}'/>
      <path d="M24.9281 12.4927C24.9131 12.2096 24.7937 11.9388 24.5917 11.7298C24.5917 11.7298 24.5907 11.7288 24.5897 11.7277L22.5558 9.62539C22.3309 9.39477 22.0414 9.27637 21.7618 9.27637C21.518 9.27637 21.2831 9.36594 21.106 9.54817L20.917 9.74378L20.2662 10.3903L13.9863 16.8858L17.5606 20.584L24.6644 13.2268C24.8485 13.0363 24.941 12.7748 24.9271 12.4917L24.9281 12.4927Z" fill='${isCurrent ? '#F2CB80' : '#BDBDBD'}'/>
      <path d="M13.4122 17.7464L11.9872 22.122C11.8947 22.4062 12.1066 22.678 12.3713 22.678C12.4141 22.678 12.4579 22.6708 12.5017 22.6553L16.7446 21.1933L13.4122 17.7454V17.7464Z" fill='${isCurrent ? '#F2CB80' : '#BDBDBD'}'/>
      </svg>
      ''',
      allowDrawingOutsideViewBox: true,
    );
  }
}
