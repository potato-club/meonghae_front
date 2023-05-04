import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
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
                    color: CustomColor.ivoey2,
                    borderRadius: BorderRadius.circular(27)),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "멍해님 안녕하세요!",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings_sharp,
                            size: 10,
                            color: CustomColor.gray,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2, bottom: 2),
                            child: Text(
                              "업데이트 공지 2.0.10.2",
                              style: TextStyle(
                                fontSize: 10,
                                color: CustomColor.gray,
                              ),
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
