import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/review_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/svg/like.dart';

class ReviewListItemWidget extends StatelessWidget {
  final Function fetchReviewData;
  final Map<String, dynamic> review;
  const ReviewListItemWidget(
      {super.key, required this.review, required this.fetchReviewData});

  @override
  Widget build(BuildContext context) {
    Future<void> onClickLike(bool isLike) async {
      try {
        final dio = Dio();
        var token = await readAccessToken();
        dio.options.headers['Authorization'] = token;
        final response = await dio.post(
            '${baseUrl}community-service/reviews/${review['id']}/recommend',
            data: {"isLike": isLike});
        if (response.statusCode == 200) {
          fetchReviewData();
        } else {
          SnackBarWidget.show(context, SnackBarType.error,
              "${isLike ? "좋아요" : "싫어요"} 등록에 실패하였습니다");
        }
      } catch (error) {
        SnackBarWidget.show(context, SnackBarType.error, error.toString());
      }
    }

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
                      clipBehavior: Clip.hardEdge,
                      width: 37,
                      height: 37,
                      decoration: const BoxDecoration(
                          color: CustomColor.lightGray3,
                          shape: BoxShape.circle),
                      child: Transform.scale(
                        scale: 1.8,
                        child: review["profileUrl"] != null
                            ? Image.network(
                                review["profileUrl"],
                                fit: BoxFit.cover,
                              )
                            : const Image(
                                image: AssetImage(
                                  'assets/images/dog_pictures/face.png',
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          review['nickname'],
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.black2),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            StarRatingWidget(rate: review['rating']),
                            const SizedBox(width: 8),
                            const Text('2023.05.21',
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
                      child: Text(
                        review['title'],
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2),
                      ),
                    ),
                    if (review['images'] != null)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            review['images'][0]['fileUrl'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 100,
                      child: Text(
                        review['content'],
                        style: const TextStyle(
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
                    InkWell(
                        onTap: () => onClickLike(true), child: const LikeSVG()),
                    const SizedBox(width: 4),
                    Text("${review['likes']}",
                        style: const TextStyle(
                            fontSize: 11, color: CustomColor.gray)),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () => onClickLike(false),
                        child: Transform.rotate(
                            angle: -3.14, child: const LikeSVG())),
                    const SizedBox(width: 4),
                    Text("${review['dislikes']}",
                        style: const TextStyle(
                            fontSize: 11, color: CustomColor.gray)),
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
