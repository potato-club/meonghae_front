import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/check.dart';
import 'package:meonghae_front/widgets/svg/filter_check.dart';

enum FilterType {
  late,
  star,
  comment,
}

class FilterBarWidget extends StatefulWidget {
  final Map<String, dynamic> searchingForm;
  final Function setIsCheckedPhotoReview;
  const FilterBarWidget(
      {super.key,
      required this.searchingForm,
      required this.setIsCheckedPhotoReview});

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  FilterType filterType = FilterType.late;

  void updateSortValue(String sortValue) {
    setState(() {
      widget.searchingForm['sort'] = sortValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: () => widget.setIsCheckedPhotoReview(),
              child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                      color: widget.searchingForm['isCheckedPhotoReviews']
                          ? CustomColor.brown1
                          : Colors.transparent,
                      border: widget.searchingForm['isCheckedPhotoReviews']
                          ? null
                          : Border.all(
                              color: CustomColor.black4, // 테두리 색상 설정
                              width: 1 // 테두리 두께 설정
                              ),
                      borderRadius: BorderRadius.circular(5)),
                  child: widget.searchingForm['isCheckedPhotoReviews']
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                if (filterType != FilterType.late) {
                  setState(() {
                    filterType = FilterType.late;
                    updateSortValue('LATEST');
                  });
                }
              },
              child: Row(
                children: [
                  Text('최신순',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: filterType == FilterType.late
                            ? CustomColor.black2
                            : CustomColor.lightGray2,
                      )),
                  const SizedBox(width: 2),
                  FilterCheckSVG(
                      isChecked: filterType == FilterType.late ? true : false),
                ],
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                if (filterType != FilterType.star) {
                  setState(() {
                    filterType = FilterType.late;
                    updateSortValue(
                        'RATING_ASC'); // Update the sort value to 'LATEST'
                  });
                }
              },
              child: Row(
                children: [
                  Text('별점순',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: filterType == FilterType.star
                            ? CustomColor.black2
                            : CustomColor.lightGray2,
                      )),
                  const SizedBox(width: 2),
                  FilterCheckSVG(
                      isChecked: filterType == FilterType.star ? true : false),
                ],
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                if (filterType != FilterType.comment) {
                  setState(() {
                    filterType = FilterType.late;
                    updateSortValue('RECOMMEND');
                  });
                }
              },
              child: Row(
                children: [
                  Text('댓글순',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: filterType == FilterType.comment
                            ? CustomColor.black2
                            : CustomColor.lightGray2,
                      )),
                  const SizedBox(width: 2),
                  FilterCheckSVG(
                      isChecked:
                          filterType == FilterType.comment ? true : false),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
