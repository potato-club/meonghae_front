import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/screens/review_write_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_screen/filter_bar_widget.dart';
import 'package:meonghae_front/widgets/review_screen/review_list_item_widget.dart';
import 'package:meonghae_front/widgets/review_screen/search_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class ReviewScreen extends StatefulWidget {
  final String menuValue;
  const ReviewScreen({super.key, required this.menuValue});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  Map<String, dynamic> searchingForm = {
    'isCheckedPhotoReviews': false,
    'sort': 'LATEST',
    'keyword': null,
  };

  void setIsCheckedPhotoReview() {
    setState(() => searchingForm['isCheckedPhotoReviews'] =
        !searchingForm['isCheckedPhotoReviews']);
    fetchData();
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  Map<String, int> ReviewMenuMap = {
    '넥카라': 1,
    '목줄': 2,
    '장난감': 3,
    '방석': 4,
    '목욕용품': 5,
    '사료': 6,
    '강아지껌': 7,
    '입마개': 8,
    '유모차': 9,
    '배변패드': 10,
    '간식': 11,
    '바디용품': 12,
  };

  List<dynamic> reviews = [];
  Future<void> fetchData() async {
    SendAPI.get(
      context: context,
      url: "/community-service/reviews/${ReviewMenuMap[widget.menuValue]}",
      request: {
        "sort": searchingForm['sort'],
        if (searchingForm['keyword'] != null)
          "keyword": searchingForm['keyword'],
        "photo": searchingForm['isCheckedPhotoReviews']
      },
      successFunc: (data) {
        setState(() => reviews = data.data['content']);
      },
      errorMsg: "리뷰정보 호출에 실패하였습니다",
    );
  }

  @override
  Widget build(BuildContext context) {
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
            child: SearchBarWidget(
                fetchReviewData: fetchData, searchingForm: searchingForm),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: FilterBarWidget(
              fetchReviewData: fetchData,
              searchingForm: searchingForm,
              setIsCheckedPhotoReview: setIsCheckedPhotoReview,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(children: [
              ListView(
                children: [
                  const SizedBox(height: 26),
                  ...reviews
                      .map((e) => ReviewListItemWidget(
                            fetchReviewData: fetchData,
                            review: e,
                          ))
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
              Positioned(
                  bottom: 16,
                  right: 16,
                  child: InkWell(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            ReviewWriteScreen(fetchData: fetchData))),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: CustomColor.brown1,
                      ),
                      width: 70,
                      height: 70,
                      child: const Padding(
                        padding: EdgeInsets.all(22),
                        child: PencilSVG(
                          color: CustomColor.white,
                        ),
                      ),
                    ),
                  ))
            ]),
          )
        ],
      )),
    );
  }
}
