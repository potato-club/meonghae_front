import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/post_detail_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_comment.dart';
import 'package:meonghae_front/widgets/svg/tiny_heart.dart';
import 'package:meonghae_front/widgets/svg/tiny_picture.dart';

class PostListItemWidget extends StatelessWidget {
  const PostListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const PostDetailScreen(
                id: 1,
              ))),
      child: Container(
        height: 122,
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
                        '우리 강아지 천재 아닐까..?',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 87,
                      child: const Text(
                        '진짜 어그로 아니고 우리 강아지는 천재 아닐까 생각 중이야.. 내가 한말 다 알아듣고 이름 부르면 나한테 달려옴 ㅇㅇ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
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
