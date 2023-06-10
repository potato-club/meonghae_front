import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/models/infoModel.dart';
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
  List<InfoModel> formsData = [];
  List<Widget> registerSliders = [];
  int currentSlideIndex = 0;

  void addFormsData() {
    InfoModel newItem = InfoModel(
      gender: '',
      kind: '',
      place: '',
      name: '',
      birth: '',
      imageFile: null,
    );
    formsData.add(newItem);
  }

  void setData(int index, String key, dynamic value) {
    switch (key) {
      case 'gender':
        formsData[index].gender = value;
        break;
      case 'kind':
        formsData[index].kind = value;
        break;
      case 'place':
        formsData[index].place = value;
        break;
      case 'name':
        formsData[index].name = value;
        break;
      case 'birth':
        formsData[index].birth = value;
        break;
      case 'imageFile':
        formsData[index].imageFile = value;
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
        data: formsData[registerSliders.length],
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
        data: formsData[registerSliders.length],
        index: registerSliders.length,
        setData: setData,
      ));
    });
  }

  Future<void> _submitForm() async {
    print(currentSlideIndex);
    print(formsData);
    print(formsData.length);
    formsData.forEach((i) {
      print("${i.name}/${i.gender}/${i.birth}/${i.kind}/${i.place}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35 - 130,
                child: Stack(children: [
                  Stack(children: [
                    Positioned(
                      bottom: 12,
                      left: MediaQuery.of(context).size.width * 0.16,
                      child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child:
                              const ArrowSVG(strokeColor: CustomColor.black2)),
                    ),
                    const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '내 강아지/고양이',
                            style: TextStyle(
                              color: CustomColor.black2,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '정보 입력',
                            style: TextStyle(
                              color: CustomColor.black2,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ]),
              ),
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height * 0.65 + 130,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      setState(() => currentSlideIndex = index),
                ),
                items: registerSliders,
              )
            ],
          ),
          Positioned(
            bottom: 24,
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
            bottom: MediaQuery.of(context).size.height * 0.65 - 420,
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
                onPressed: _submitForm, //수정필요
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
            bottom: MediaQuery.of(context).size.height * 0.65 - 344,
            right: MediaQuery.of(context).size.width * 0.145,
            child: GestureDetector(
              onTap: () => addSliderItem(),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '추가하기',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.white,
                    ),
                  ),
                  SizedBox(width: 6),
                  TinyRightArrowSVG(color: CustomColor.white)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
