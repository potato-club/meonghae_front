import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/user/user_info.dart';
import 'package:meonghae_front/widgets/svg/gear.dart';

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
    return Container(
      decoration: BoxDecoration(color: CustomColor.white),
      child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.06,
          top: 34,
          bottom: 34,
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: CustomColor.ivory2),
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
            SizedBox(width: 13),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "$name님 안녕하세요!",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: CustomColor.black2,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GearSVG(strokeColor: CustomColor.black2),
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text(
                        "업데이트 공지 2.0.10.2",
                        style: TextStyle(
                            fontSize: 10,
                            color: CustomColor.black2,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
