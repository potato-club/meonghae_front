import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/check.dart';
import 'package:meonghae_front/widgets/svg/filter_check.dart';

class FilterBarWidget extends StatefulWidget {
  const FilterBarWidget({super.key});

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GetX<ReviewController>(builder: (controller) {
              return InkWell(
                onTap: () => controller.setIsPhoto(),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: controller.isPhoto.value
                            ? CustomColor.brown1
                            : Colors.transparent,
                        border: controller.isPhoto.value
                            ? null
                            : Border.all(
                                color: CustomColor.black4, // 테두리 색상 설정
                                width: 1 // 테두리 두께 설정
                                ),
                        borderRadius: BorderRadius.circular(5)),
                    child: controller.isPhoto.value
                        ? const Center(
                            child: CheckSVG(color: CustomColor.white))
                        : null),
              );
            }),
            const SizedBox(width: 8),
            const Text('사진리뷰 보기',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: CustomColor.black4)),
          ],
        ),
        GetX<ReviewController>(builder: (controller) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              InkWell(
                onTap: () => controller.setSort('LATEST'),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Text('최신순',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: controller.sort.value == 'LATEST'
                                ? CustomColor.black2
                                : CustomColor.lightGray2,
                          )),
                      const SizedBox(width: 2),
                      FilterCheckSVG(
                          isChecked:
                              controller.sort.value == 'LATEST' ? true : false),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () => controller.setSort('RATING_DESC'),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Text('별점순',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: controller.sort.value == 'RATING_DESC'
                                ? CustomColor.black2
                                : CustomColor.lightGray2,
                          )),
                      const SizedBox(width: 2),
                      FilterCheckSVG(
                          isChecked: controller.sort.value == 'RATING_DESC'
                              ? true
                              : false),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: () => controller.setSort('RECOMMEND'),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Text('관심순',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: controller.sort.value == 'RECOMMEND'
                                ? CustomColor.black2
                                : CustomColor.lightGray2,
                          )),
                      const SizedBox(width: 2),
                      FilterCheckSVG(
                          isChecked: controller.sort.value == 'RECOMMEND'
                              ? true
                              : false),
                    ],
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}
