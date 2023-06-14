import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/screens/review_write_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
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
  void setIsCheckedPhotoReview() {
    setState(() => searchingForm['isCheckedPhotoReviews'] =
        !searchingForm['isCheckedPhotoReviews']);
  }

  Map<String, dynamic> searchingForm = {
    'isCheckedPhotoReviews': false,
    'sort': 'LATEST',
    'keyword': '',
  };

  @override
  void initState() {
    super.initState();
    fetchData();
    print(widget.menuValue);
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
    try {
      final dio = Dio();
      // var token = await readAccessToken();
      dio.options.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0aGR3bzk5OUBuYXZlci5jb20iLCJyb2xlcyI6WyJVU0VSIl0sImlhdCI6MTY4Njc3MDQ0OSwiZXhwIjoxNjg2NzcyMjQ5fQ.K9_VfhQcC_PAeW6IN5CIAT00MHH59Xn7wn-tLnvgJJU';
      final response = await dio.get(
        '${baseUrl}community-service/reviews/${ReviewMenuMap[widget.menuValue]}',
        queryParameters: {},
      );
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        setState(() => reviews = data['content']);
        print(reviews);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, "리뷰 정보 호출에 실패하였습니다");
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
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
            child: SearchBarWidget(searchingForm: searchingForm),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: FilterBarWidget(
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
                  if (searchingForm['isCheckedPhotoReviews'])
                    ...reviews
                        .where((element) => element['image'] != null)
                        .map((e) => ReviewListItemWidget(
                              review: e,
                            ))
                        .toList()
                  else
                    ...reviews
                        .map((e) => ReviewListItemWidget(
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
                            const ReviewWriteScreen())),
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
