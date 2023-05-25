import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/images_swiper_widget.dart';
import 'package:meonghae_front/widgets/svg/comment.dart';
import 'package:meonghae_front/widgets/svg/heart.dart';

class DetailContentWidget extends StatefulWidget {
  final List<String> images;
  const DetailContentWidget({super.key, required this.images});

  @override
  State<DetailContentWidget> createState() => _DetailContentWidgetState();
}

class _DetailContentWidgetState extends State<DetailContentWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 20,
          left: MediaQuery.of(context).size.width * 0.06,
          right: MediaQuery.of(context).size.width * 0.06,
          bottom: 12),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 37,
                height: 37,
                decoration: const BoxDecoration(
                    color: CustomColor.lightGray3, shape: BoxShape.circle),
                child: Transform.scale(
                  scale: 1.8,
                  child: const Image(
                    image: AssetImage(
                      'assets/images/dog_pictures/face.png',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88 - 49,
                child: Transform.translate(
                  offset: const Offset(0, 8),
                  child: const Text(
                    '서울역 근처에서 강아지를 잃어버렸어요',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ImagesSwiperWidget(images: widget.images),
          const SizedBox(height: 40),
          const Text(
            '이름: 멍멍이\n나이: 7살\n견종: 시고르자브종\n특징: 등에 흰 무늬가 있어요, 어깨에도 동그란 흰 무늬가 있어요\n내용: 진돗개, 시바견 종을 많이 닮은 시고르자브종입니다. 3/29 19시경에 실종되었습니다',
            style: TextStyle(fontSize: 12, height: 1.4),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              HeartSVG(isFilled: false),
              SizedBox(width: 4),
              Text('12',
                  style: TextStyle(fontSize: 13, color: CustomColor.gray)),
              SizedBox(width: 12),
              CommentSVG(),
              SizedBox(width: 4),
              Text('12',
                  style: TextStyle(fontSize: 13, color: CustomColor.gray)),
            ],
          )
        ],
      ),
    );
  }
}
