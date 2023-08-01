import 'package:flutter/material.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/review_screen/images_swiper_widget.dart';
import 'package:meonghae_front/widgets/review_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/svg/like.dart';

class ReviewListItemWidget extends StatefulWidget {
  final Function fetchReviewData;
  final Map<String, dynamic> review;
  const ReviewListItemWidget(
      {super.key, required this.review, required this.fetchReviewData});

  @override
  State<ReviewListItemWidget> createState() => _ReviewListItemWidgetState();
}

class _ReviewListItemWidgetState extends State<ReviewListItemWidget> {
  Future<void> onClickLike(bool isLike) async {
    SendAPI.post(
      url: "/community-service/reviews/${widget.review['id']}/recommend",
      request: {"isLike": isLike},
      successFunc: (data) => widget.fetchReviewData(),
      errorMsg: "${isLike ? "좋아요" : "싫어요"} 등록에 실패하였습니다",
    );
  }

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
                      clipBehavior: Clip.hardEdge,
                      width: 37,
                      height: 37,
                      decoration: const BoxDecoration(
                          color: CustomColor.lightGray3,
                          shape: BoxShape.circle),
                      child: Transform.scale(
                        scale: 1.8,
                        child: widget.review["profileUrl"] != null
                            ? Image.network(
                                widget.review["profileUrl"],
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
                          widget.review['nickname'],
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.black2),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            StarRatingWidget(rate: widget.review['rating']),
                            const SizedBox(width: 8),
                            Text(
                                widget.review['date']
                                        .substring(0, 10)
                                        .replaceAll('-', '.') ??
                                    '',
                                style: const TextStyle(
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
                        widget.review['title'],
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2),
                      ),
                    ),
                    if (widget.review['images'] != null)
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: ImagesSwiperWidget(
                              images: widget.review['images'])),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 100,
                      child: Text(
                        widget.review['content'],
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
                        onTap: () => onClickLike(true),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: LikeSVG(
                            color: widget.review['recommendStatus'] == 'TRUE'
                                ? CustomColor.brown1
                                : CustomColor.lightGray2)),
                    const SizedBox(width: 4),
                    Text("${widget.review['likes']}",
                        style: const TextStyle(
                            fontSize: 11, color: CustomColor.gray)),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () => onClickLike(false),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Transform.rotate(
                            angle: -3.14,
                            child: LikeSVG(
                                color:
                                    widget.review['recommendStatus'] == 'FALSE'
                                        ? CustomColor.brown1
                                        : CustomColor.lightGray2))),
                    const SizedBox(width: 4),
                    Text("${widget.review['dislikes']}",
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
