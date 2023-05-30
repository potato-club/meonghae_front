import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_screen/filter_bar_widget.dart';
import 'package:meonghae_front/widgets/review_screen/review_list_item_widget.dart';
import 'package:meonghae_front/widgets/review_screen/search_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class ReviewScreen extends StatefulWidget {
  final String menuValue;
  const ReviewScreen({super.key, required this.menuValue});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  bool isCheckedPhotoReview = false;
  void setIsCheckedPhotoReview() {
    setState(() => isCheckedPhotoReview = !isCheckedPhotoReview);
    print(isCheckedPhotoReview);
  }

  @override
  Widget build(BuildContext context) {
    const List list = [
      {'image': false},
      {'image': true},
      {'image': false},
      {'image': false},
      {'image': false},
      {'image': true},
      {'image': true},
      {'image': false},
      {'image': true},
      {'image': false},
      {'image': true},
      {'image': false},
    ];
    final ImageList = list.where((item) => item['image'] == true).toList();
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 62,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const ArrowSVG(strokeColor: CustomColor.black2)),
                  const SizedBox(width: 20),
                  Text(widget.menuValue,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: CustomColor.black2))
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: const SearchBarWidget(),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: FilterBarWidget(
              isCheckedPhotoReview: isCheckedPhotoReview,
              setIsCheckedPhotoReview: setIsCheckedPhotoReview,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(children: [
              ListView(
                children: [
                  const SizedBox(height: 26),
                  if (isCheckedPhotoReview)
                    ...list
                        .where((element) => element['image'] == true)
                        .map((e) => ReviewListItemWidget(isImage: e['image']))
                        .toList()
                  else
                    ...list
                        .map((e) => ReviewListItemWidget(isImage: e['image']))
                        .toList(),
                  const SizedBox(height: 60),
                ],
              ),
              Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        CustomColor.white,
                        CustomColor.white.withOpacity(0),
                      ])),
                  height: 32,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}
