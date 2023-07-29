import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/my_page_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/storages//user/user_info.dart';
import 'package:meonghae_front/widgets/svg/gear.dart';
import 'package:meonghae_front/widgets/svg/tiny_bottom_arrow.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  String? name = '멍해';
  String? image;

  @override
  void initState() {
    readUserInfo();
    super.initState();
  }

  Future<void> readUserInfo() async {
    var userName = await readUserNickname();
    var userFileUrl = await readUserFileUrl();
    setState(() {
      name = userName;
      image = userFileUrl.toString();
    });
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
                decoration: const BoxDecoration(
                    color: CustomColor.white, shape: BoxShape.circle),
                clipBehavior: Clip.hardEdge,
                child: image != null
                    ? Image.network(image!, fit: BoxFit.cover)
                    : Transform.scale(
                        scale: 1.8,
                        child: const Image(
                          image: AssetImage(
                            'assets/images/dog_pictures/face.png',
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$name님 안녕하세요!",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GearSVG(strokeColor: CustomColor.white),
                          Padding(
                            padding: EdgeInsets.only(left: 4),
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
      ),
      Positioned(
        right: 0,
        bottom: 0,
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => const MyPageScreen())),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Text(
                '마이페이지',
                style: TextStyle(fontSize: 12, color: CustomColor.black2),
              ),
              SizedBox(width: 2),
              Transform.rotate(
                  angle: -1.58,
                  child: TinyBottomArrowSVG(strokeColor: CustomColor.black2))
            ]),
          ),
        ),
      )
    ]);
  }
}
