import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/add_button_widget.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/edit_button_widget.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/edit_dog_info_widget.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/no_dog_info_widget.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/pagination_widget.dart';
import 'package:meonghae_front/widgets/my_page_dog_screen/show_dog_info_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/trash.dart';

class MyPageDogScreen extends StatefulWidget {
  const MyPageDogScreen({super.key});

  @override
  State<MyPageDogScreen> createState() => _MyPageDogScreenState();
}

class _MyPageDogScreenState extends State<MyPageDogScreen> {
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Get.find<DogController>().willPop(),
      child: Scaffold(
          backgroundColor: CustomColor.white,
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GetX<DogController>(builder: (controller) {
                List<GlobalKey<FormFieldState>> formKeys = [];
                for (var element in controller.dogsForm) {
                  formKeys.add(GlobalKey<FormFieldState>());
                }
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
                              onTap: () => controller.willPop(),
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
                                    height: 24,
                                    child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: ArrowSVG(
                                            strokeColor: CustomColor.black2))),
                              ),
                            ),
                            const Text(
                              '애완동물 정보 수정',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.black2),
                            ),
                            (controller.isEdit.value)
                                ? InkWell(
                                    onTap: () => controller.addDeleteIdList(),
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.06,
                                        vertical: 20,
                                      ),
                                      child: const SizedBox(
                                          width: 24,
                                          child: Align(
                                              alignment: Alignment.centerRight,
                                              child: TrashSVG(
                                                  strokeColor:
                                                      CustomColor.black2))),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.06,
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
                            child: (controller.dogsInfo.isEmpty &&
                                    !controller.isEdit.value)
                                ? const NoDogInfoWidget()
                                : SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    child: CarouselSlider(
                                      carouselController: _carouselController,
                                      options: CarouselOptions(
                                        initialPage:
                                            controller.slideIndex.value,
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
                                                  i <
                                                      controller
                                                          .dogsForm.length;
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
                            child: EditButtonWidget(
                                carouselController: _carouselController)),
                        Positioned(
                          bottom: MediaQuery.of(context).size.height * 0.1 - 28,
                          left: 0,
                          right: 0,
                          child: const PaginationWidget(),
                        ),
                        if (controller.isEdit.value)
                          Positioned(
                            top: MediaQuery.of(context).size.height * 0.06 + 98,
                            right: MediaQuery.of(context).size.width * 0.13 - 8,
                            child: InkWell(
                                onTap: () {
                                  controller.addDogForm();
                                  _carouselController.animateToPage(
                                      controller.dogsForm.length,
                                      duration:
                                          const Duration(milliseconds: 1000),
                                      curve: Curves.ease);
                                },
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: const AddButtonWidget()),
                          ),
                        if (controller.isLoading.value)
                          const Positioned(
                              child: Center(
                                  child: LoadingDotWidget(
                                      color: CustomColor.black2)))
                      ]),
                    )
                  ],
                );
              }),
            ),
          )),
    );
  }
}
