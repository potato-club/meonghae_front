import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/models/info_model.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
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
  List<InfoModel> formsData = [];
  List<Widget> registerSliders = [];
  int currentSlideIndex = 0;

  void addFormsData() {
    InfoModel newItem = InfoModel(
      petGender: '',
      petSpecies: '',
      meetRoute: '',
      petName: '',
      petBirth: '',
      file: null,
    );
    formsData.add(newItem);
  }

  void setData(int index, String key, dynamic value) {
    switch (key) {
      case 'gender':
        formsData[index].petGender = value;
        break;
      case 'kind':
        formsData[index].petSpecies = value;
        break;
      case 'place':
        formsData[index].meetRoute = value;
        break;
      case 'name':
        formsData[index].petName = value;
        break;
      case 'birth':
        formsData[index].petBirth = value;
        break;
      case 'imageFile':
        formsData[index].file = value;
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    addFormsData();
    registerSliders = [
      RegisterInitForm(
        formData: formsData[registerSliders.length],
        index: registerSliders.length,
        setData: setData,
      ),
    ];
  }

  void addSliderItem() {
    _carouselController.animateToPage(registerSliders.length);
    setState(() {
      addFormsData();
      registerSliders.add(RegisterInitForm(
        formData: formsData[registerSliders.length],
        index: registerSliders.length,
        setData: setData,
      ));
    });
  }

  Future<void> _submitForm() async {
    List<Map<String, dynamic>> result =
        formsData.map((i) => validator(i)).toList();
    List<dynamic> validatorList = result.map((i) => i['validator']).toList();
    bool isValidator = !validatorList.contains(false);
    if (isValidator) {
      for (int i = 0; i < formsData.length; i++) {
        dio.FormData formData = dio.FormData.fromMap({
          "meetRoute": formsData[i].toJson()['meetRoute'],
          "petBirth": formsData[i].toJson()['petBirth'],
          "petGender":
              formsData[i].toJson()['petGender'] == '남' ? 'BOY' : 'GIRL',
          "petName": formsData[i].toJson()['petName'],
          "petSpecies": formsData[i].toJson()['petSpecies'],
          if (formsData[i].file != null)
            "image": await dio.MultipartFile.fromFile(formsData[i].file!.path)
        });
        SendAPI.post(
          url: "/profile-service/profile",
          request: formData,
          successFunc: (data) => Get.offNamed(AppRoutes.introVideo),
          errorMsg: "애완동물정보 등록에 실패하였어요",
        );
      }
    } else {
      int index = validatorList.indexOf(false);
      SnackBarWidget.show(SnackBarType.error, result[index]['error']);
    }
  }

  Map<String, dynamic> validator(InfoModel data) {
    if (data.petBirth != '' &&
        data.petGender != '' &&
        data.petSpecies != '' &&
        data.petName != '') {
      if (data.petBirth.length != 10) {
        return {'validator': false, 'error': '출생일은 숫자 8자만 입력해주세요'};
      } else {
        return {'validator': true};
      }
    } else {
      return {'validator': false, 'error': '모든 정보를 입력해주세요'};
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.08),
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
                                  height: MediaQuery.of(context).size.height *
                                          0.67 +
                                      65,
                                  viewportFraction: 1.0,
                                  enableInfiniteScroll: false,
                                  onPageChanged: (index, reason) =>
                                      setState(() => currentSlideIndex = index),
                                ),
                                items: registerSliders,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
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
                      for (var i = 0; i < registerSliders.length; i++)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 3),
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
                      onPressed: _submitForm,
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
                  top: MediaQuery.of(context).size.height * 0.39 + 6,
                  right: MediaQuery.of(context).size.width * 0.13 - 8,
                  child: InkWell(
                    onTap: () => addSliderItem(),
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
            ),
          ),
        ),
      ),
    );
  }
}
