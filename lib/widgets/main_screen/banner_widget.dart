import 'package:flutter/material.dart';

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
          color: const Color(0xFFF2CB80),
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
                    color: const Color(0xFFEAEAEA),
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
                            color: Color(0xFF999999),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2, bottom: 2),
                            child: Text(
                              "업데이트 공지 2.0.10.2",
                              style: TextStyle(
                                fontSize: 10,
                                color: Color(0xFF999999),
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
