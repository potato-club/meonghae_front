import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.white,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: GetX<DogController>(builder: (controller) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.072),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.slideIndex.value = 0;
                              controller.setIsEdit(false);
                              Get.back();
                            },
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
                                vertical: 20),
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
                          child: controller.dogsForm.isEmpty
                              ? Center(
                                  child: Column(
                                    children: [
                                      SizedBox(
                                          height: 65,
                                          child: Transform.translate(
                                              offset: const Offset(0, 10),
                                              child: Transform.scale(
                                                  scale: 2.0,
                                                  child: Image.asset(
                                                      'assets/images/dog_pictures/peek_dog.png')))),
                                      SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08),
                                      const Text(
                                        '아직 애완동물의 정보가 없어요...',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: CustomColor.white),
                                      ),
                                      const SizedBox(height: 20),
                                      const Text(
                                        '추가하기 버튼을 눌러\n새로운 애완동물의 정보를 입력해주세요',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          height: 1.3,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: CustomColor.black2,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: CarouselSlider(
                                    carouselController: _carouselController,
                                    options: CarouselOptions(
                                      initialPage: controller.slideIndex.value,
                                      height:
                                          MediaQuery.of(context).size.height *
                                                  0.67 +
                                              65,
                                      viewportFraction: 1.0,
                                      enableInfiniteScroll: false,
                                      onPageChanged: (index, reason) =>
                                          controller.slideIndex.value = index,
                                    ),
                                    items: controller.isEdit.value
                                        ? [
                                            for (int i = 0;
                                                i < controller.dogsForm.length;
                                                i++)
                                              EditDogInfoWidget(index: i)
                                          ]
                                        : controller.dogsInfo
                                            .map((e) =>
                                                ShowDogInfoWidget(dogInfo: e))
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
                              if (controller.isEdit.value) {
                                controller.editForm();
                                if (controller.isError.value) {
                                  _carouselController.animateToPage(
                                      controller.slideIndex.value,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.ease);
                                  controller.isError.value = false;
                                }
                              } else {
                                controller.setIsEdit(true);
                                if (controller.dogsInfo.isEmpty) {
                                  controller.addDogForm();
                                }
                              }
                            },
                            child: Text(
                              controller.isEdit.value
                                  ? '저장하기'
                                  : controller.dogsInfo.isEmpty
                                      ? '추가하기'
                                      : '수정하기',
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
                            children: controller.isEdit.value
                                ? [
                                    for (var i = 0;
                                        i < controller.dogsForm.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.slideIndex.value == i
                                                    ? CustomColor.black2
                                                    : CustomColor.gray,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                      )
                                  ]
                                : [
                                    for (var i = 0;
                                        i < controller.dogsInfo.length;
                                        i++)
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3),
                                        child: Container(
                                          width: 6,
                                          height: 6,
                                          decoration: BoxDecoration(
                                            color:
                                                controller.slideIndex.value == i
                                                    ? CustomColor.black2
                                                    : CustomColor.gray,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                      ),
                                  ]),
                      ),
                      if (controller.isEdit.value)
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.06 + 98,
                          right: MediaQuery.of(context).size.width * 0.13 - 8,
                          child: InkWell(
                            onTap: () {
                              controller.addDogForm();
                              _carouselController.animateToPage(
                                  controller.dogsInfo.length,
                                  duration: const Duration(milliseconds: 1000),
                                  curve: Curves.ease);
                            },
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
              );
            }),
          ),
        ));
  }
}
