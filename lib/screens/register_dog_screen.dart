import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/register_dog_screen/register_init_form.dart';

class RegisterDogScreen extends StatefulWidget {
  const RegisterDogScreen({super.key});

  @override
  State<RegisterDogScreen> createState() => _RegisterDogScreenState();
}

class _RegisterDogScreenState extends State<RegisterDogScreen> {
  final CarouselController _carouselController = CarouselController();
  List<Widget> registerSliders = [];
  int currentSlideIndex = 0;
  bool isHovered = false;

  void _handleHover(bool isHovered) {
    setState(() {
      this.isHovered = isHovered;
    });
    _carouselController.animateToPage(registerSliders.length);
  }

  @override
  void initState() {
    super.initState();
    registerSliders = [
      const RegisterInitForm(),
    ];
  }

  void addSliderItem() {
    setState(() {
      registerSliders.add(const RegisterInitForm());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.35 - 130,
                child: const Column(
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
            bottom: MediaQuery.of(context).size.height * 0.65 - 420,
            left: MediaQuery.of(context).size.width * 0.5 - 144,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(288, 49),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: CustomColor.black2,
              ),
              onPressed: () => {}, //수정필요
              child: const Text(
                '시작하기!',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.65 - 344,
            right: MediaQuery.of(context).size.width * 0.1,
            child: GestureDetector(
              onTap: () => addSliderItem(),
              onTapDown: (_) {
                _handleHover(true);
              },
              onTapUp: (_) {
                _handleHover(false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '추가하기',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: isHovered ? FontWeight.bold : FontWeight.w400,
                      color: CustomColor.gray,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: CustomColor.gray,
                    size: 16,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
