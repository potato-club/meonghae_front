import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/check.dart';
import 'package:meonghae_front/widgets/svg/filter_check.dart';

enum FilterType {
  LATEST,
  RATING_ASC,
  RATING_DESC,
  RECOMMEND,
}

class FilterBarWidget extends StatefulWidget {
  final Map<String, dynamic> searchingForm;
  final Function setIsCheckedPhotoReview;
  final Function fetchReviewData;
  const FilterBarWidget(
      {super.key,
      required this.searchingForm,
      required this.setIsCheckedPhotoReview,
      required this.fetchReviewData});

  @override
  State<FilterBarWidget> createState() => _FilterBarWidgetState();
}

class _FilterBarWidgetState extends State<FilterBarWidget> {
  FilterType filterType = FilterType.LATEST;

  void updateSortValue(String sortValue) {
    setState(() {
      widget.searchingForm['sort'] = sortValue;
    });
    widget.fetchReviewData();
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
                if (filterType != FilterType.LATEST) {
                  setState(() {
                    filterType = FilterType.LATEST;
                    updateSortValue('LATEST');
                  });
                }
              },
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Text('최신순',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: filterType == FilterType.LATEST
                              ? CustomColor.black2
                              : CustomColor.lightGray2,
                        )),
                    const SizedBox(width: 2),
                    FilterCheckSVG(
                        isChecked:
                            filterType == FilterType.LATEST ? true : false),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                if (filterType != FilterType.RATING_DESC) {
                  setState(() {
                    filterType = FilterType.RATING_DESC;
                    updateSortValue(
                        'RATING_DESC'); // Update the sort value to 'LATEST'
                  });
                }
              },
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Text('별점순',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: filterType == FilterType.RATING_DESC
                              ? CustomColor.black2
                              : CustomColor.lightGray2,
                        )),
                    const SizedBox(width: 2),
                    FilterCheckSVG(
                        isChecked: filterType == FilterType.RATING_DESC
                            ? true
                            : false),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            InkWell(
              onTap: () {
                if (filterType != FilterType.RECOMMEND) {
                  setState(() {
                    filterType = FilterType.RECOMMEND;
                    updateSortValue('RECOMMEND');
                  });
                }
              },
              child: SizedBox(
                height: 20,
                child: Row(
                  children: [
                    Text('관심순',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: filterType == FilterType.RECOMMEND
                              ? CustomColor.black2
                              : CustomColor.lightGray2,
                        )),
                    const SizedBox(width: 2),
                    FilterCheckSVG(
                        isChecked:
                            filterType == FilterType.RECOMMEND ? true : false),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
