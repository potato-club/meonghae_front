import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/svg/tiny_picture.dart';

class ReviewListItemWidget extends StatelessWidget {
  final bool isImage;
  const ReviewListItemWidget({super.key, required this.isImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.06,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: CustomColor.lightGray1, // 테두리 색상 설정
            width: 1, // 테두리 두께 설정
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Stack(children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 37,
                      height: 37,
                      decoration: const BoxDecoration(
                          color: CustomColor.lightGray3,
                          shape: BoxShape.circle),
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '곤듀님',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.black2),
                        ),
                        SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            StarRatingWidget(rate: 4),
                            SizedBox(width: 8),
                            Text('2023.05.21',
                                style: TextStyle(
                                    fontSize: 10, color: CustomColor.gray))
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 40,
                      child: const Text(
                        '반려동물 샴푸 강추요!!!',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2),
                      ),
                    ),
                    if (isImage)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          child: const Image(
                            image: AssetImage('assets/images/dummy/dummy3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 72,
                      child: const Text(
                        '샴푸하면서 느낀건데 향기가 좋았고요.\n제형도 너무 묽지 않고 쫀쫀해서 샴푸하기 좋았어요!\n정말 추천해드리고픈 요 제품!!',
                        style: TextStyle(
                          fontSize: 11,
                          color: CustomColor.black2,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const TinyPictureSVG(),
                    const SizedBox(width: 2),
                    Transform.translate(
                      offset: const Offset(0, 2),
                      child: const Text(
                        '12',
                        style: TextStyle(fontSize: 11, color: CustomColor.gray),
                      ),
                    ),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
