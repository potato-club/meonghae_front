import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/edit_dog_info_widget.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/show_dog_info_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class MyPageDogScreen extends StatefulWidget {
  const MyPageDogScreen({super.key});

  @override
  State<MyPageDogScreen> createState() => _MyPageDogScreenState();
}

class _MyPageDogScreenState extends State<MyPageDogScreen> {
  final CarouselController _carouselController = CarouselController();
  List<dynamic> dogsInfo = [
    {'petName': '조금주'}
  ];
  int currentSlideIndex = 0;
  bool isEdit = false;
  @override
  void initState() {
    _getDogsInfo();
    super.initState();
  }

  Future<void> _getDogsInfo() async {
    SendAPI.get(
        url: "/profile-service/profile/all",
        successFunc: (data) => setState(() => dogsInfo = data.data),
        errorMsg: "애완동물정보 호출에 실패하였어요");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () => Get.back(),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.06,
                                vertical: 20,
                              ),
                              child: const SizedBox(
                                  width: 24,
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ArrowSVG(
                                          strokeColor: CustomColor.black2))),
                            ),
                          ),
                          const Text(
                            '애완동물 정보 수정',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: CustomColor.black2),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.06,
                              vertical: 20,
                            ),
                            child: const SizedBox(width: 24),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.67 + 65,
                    child: Stack(children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.67,
                          decoration: BoxDecoration(
                            color: CustomColor.brown1,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.elliptical(
                                    MediaQuery.of(context).size.width * 0.5,
                                    74),
                                topRight: Radius.elliptical(
                                    MediaQuery.of(context).size.width * 0.5,
                                    74)),
                          ),
                        ),
                      ),
                      Positioned(
                          child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: CarouselSlider(
                          carouselController: _carouselController,
                          options: CarouselOptions(
                            height:
                                MediaQuery.of(context).size.height * 0.67 + 65,
                            viewportFraction: 1.0,
                            enableInfiniteScroll: false,
                            onPageChanged: (index, reason) =>
                                setState(() => currentSlideIndex = index),
                          ),
                          items: dogsInfo
                              .map((e) => isEdit
                                  ? EditDogInfoWidget(dogInfo: e)
                                  : ShowDogInfoWidget(dogInfo: e))
                              .toList(),
                        ),
                      )),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: MediaQuery.of(context).size.height * 0.1,
                        child: Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              fixedSize: const Size(288, 49),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              backgroundColor: CustomColor.black2,
                            ),
                            onPressed: () {
                              setState(() => isEdit = !isEdit);
                            },
                            child: Text(
                              isEdit ? '저장하기' : '수정하기',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.height * 0.1 - 28,
                        left: 0,
                        right: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < dogsInfo.length; i++)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 3),
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: currentSlideIndex == i
                                        ? CustomColor.black2
                                        : CustomColor.gray,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      if (isEdit)
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.06 + 98,
                          right: MediaQuery.of(context).size.width * 0.13 - 8,
                          child: InkWell(
                            onTap: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: const Padding(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '추가하기',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: CustomColor.white,
                                    ),
                                  ),
                                  SizedBox(width: 6),
                                  TinyRightArrowSVG(color: CustomColor.white)
                                ],
                              ),
                            ),
                          ),
                        ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
