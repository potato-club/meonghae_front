import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/post_detail_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_comment.dart';
import 'package:meonghae_front/widgets/svg/tiny_heart.dart';
import 'package:meonghae_front/widgets/svg/tiny_picture.dart';

class PostMissingListItemWidget extends StatelessWidget {
  const PostMissingListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const PostDetailScreen())),
      child: Container(
        height: 160,
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
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 6),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 87,
                      child: const Text(
                        '서울역 근처에서 강아지를 잃어버렸어요',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 87,
                      child: const Text(
                        '이름: 멍멍이\n나이: 7살\n견종: 시고르자브종\n특징: 등에 흰 무늬가 있어요, 어깨에도 동그란 흰 무늬가 있어요',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
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
            const Positioned(
                bottom: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TinyHeartSVG(),
                    SizedBox(width: 2),
                    Text(
                      '12',
                      style: TextStyle(fontSize: 11, color: CustomColor.gray),
                    ),
                    SizedBox(width: 6),
                    TinyCommentSVG(),
                    SizedBox(width: 2),
                    Text(
                      '12',
                      style: TextStyle(fontSize: 11, color: CustomColor.gray),
                    ),
                    SizedBox(width: 6),
                    TinyPictureSVG()
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
