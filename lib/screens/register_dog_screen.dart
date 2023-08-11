import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/dog_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/register_dog_screen/register_init_form.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class RegisterDogScreen extends StatefulWidget {
  const RegisterDogScreen({super.key});

  @override
  State<RegisterDogScreen> createState() => _RegisterDogScreenState();
}

class _RegisterDogScreenState extends State<RegisterDogScreen> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SingleChildScrollView(
        child: GetX<DogController>(builder: (controller) {
          return Stack(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: () => Get.back(),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: const SizedBox(
                                width: 34,
                                height: 34,
                                child: Padding(
                                  padding: EdgeInsets.all(7),
                                  child:
                                      ArrowSVG(strokeColor: CustomColor.black2),
                                ),
                              )),
                          const SizedBox(width: 50),
                          const Text(
                            '내 강아지/고양이\n정보 입력',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.3,
                              color: CustomColor.black2,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 84),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.67 + 65,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.67,
                                decoration: BoxDecoration(
                                  color: CustomColor.brown1,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.elliptical(
                                          MediaQuery.of(context).size.width *
                                              0.5,
                                          74),
                                      topRight: Radius.elliptical(
                                          MediaQuery.of(context).size.width *
                                              0.5,
                                          74)),
                                ),
                              ),
                            ),
                            Positioned(
                              child: CarouselSlider(
                                carouselController: _carouselController,
                                options: CarouselOptions(
                                  initialPage: controller.slideIndex.value,
                                  height: MediaQuery.of(context).size.height *
                                          0.67 +
                                      65,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) =>
                                      controller.slideIndex.value = index,
                                ),
                                items: [
                                  for (int i = 0;
                                      i < controller.dogsForm.length;
                                      i++)
                                    RegisterInitForm(index: i),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
                    for (var i = 0; i < controller.dogsForm.length; i++)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: controller.slideIndex.value == i
                                ? CustomColor.black2
                                : CustomColor.gray,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).size.height * 0.1,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.145),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(288, 49),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: CustomColor.black2,
                    ),
                    onPressed: () {
                      controller.submitForm();
                      if (controller.isError.value) {
                        _carouselController.animateToPage(
                            controller.slideIndex.value,
                            duration: const Duration(milliseconds: 1000),
                            curve: Curves.ease);
                        controller.isError.value = false;
                      }
                    },
                    child: const Text(
                      '시작하기!',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.39 + 35,
                right: MediaQuery.of(context).size.width * 0.13 - 8,
                child: InkWell(
                  onTap: () {
                    controller.addDogForm();
                    _carouselController.animateToPage(
                        controller.dogsForm.length,
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
              )
            ],
          );
        }),
      ),
    );
  }
}
