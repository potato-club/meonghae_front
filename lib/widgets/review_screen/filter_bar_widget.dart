import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/check.dart';
import 'package:meonghae_front/widgets/svg/bottom_arrow.dart';

class FilterBarWidget extends StatelessWidget {
  final bool isCheckedPhotoReview;
  final Function setIsCheckedPhotoReview;
  const FilterBarWidget(
      {super.key,
      required this.isCheckedPhotoReview,
      required this.setIsCheckedPhotoReview});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => setIsCheckedPhotoReview(),
              child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: isCheckedPhotoReview
                          ? CustomColor.brown1
                          : Colors.transparent,
                      border: isCheckedPhotoReview
                          ? null
                          : Border.all(
                              color: CustomColor.black4, // 테두리 색상 설정
                              width: 1 // 테두리 두께 설정
                              ),
                      borderRadius: BorderRadius.circular(5)),
                  child: isCheckedPhotoReview
                      ? const Center(child: CheckSVG(color: CustomColor.white))
                      : null),
            ),
            const SizedBox(width: 8),
            const Text('사진리뷰 보기',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black4)),
          ],
        ),
        const Row(
          children: [
            Text('최신순',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black4)),
            SizedBox(width: 4),
            BottomArrowSVG(size: 10, color: CustomColor.black4)
          ],
        ),
      ],
    );
  }
}
