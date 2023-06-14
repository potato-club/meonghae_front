import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/user/user_info.dart';
import 'package:meonghae_front/widgets/svg/tiny_gear.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  String? name = '멍해';
  late String? image;

  @override
  void initState() {
    readUserInfo();
    super.initState();
  }

  Future<void> readUserInfo() async {
    var userName = await readUserNickname();
    setState(() => name = userName);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(
          color: CustomColor.brown1,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                  color: CustomColor.white,
                  borderRadius: BorderRadius.circular(27),
                ),
                child: Transform.scale(
                  scale: 1.8,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/dog_pictures/face.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${name}님 안녕하세요!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TinyGearSVG(),
                          Padding(
                            padding: EdgeInsets.only(left: 4, bottom: 2),
                            child: Text(
                              "업데이트 공지 2.0.10.2",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: CustomColor.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      const Positioned(
        right: 0,
        top: -60,
        child: Image(
            image: AssetImage('assets/images/dog_pictures/bone_dog.png'),
            width: 116),
      )
    ]);
  }
}
