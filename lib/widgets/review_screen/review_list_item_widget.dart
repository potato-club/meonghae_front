import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/models/review_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/review_screen/images_swiper_widget.dart';
import 'package:meonghae_front/widgets/review_screen/star_rating_widget.dart';
import 'package:meonghae_front/widgets/svg/like.dart';
import 'package:meonghae_front/widgets/svg/tiny_more.dart';

class ReviewListItemWidget extends StatefulWidget {
  final ReviewModel reviewData;
  final int index;
  final Function setIsMoreModal;
  const ReviewListItemWidget({
    super.key,
    required this.reviewData,
    required this.index,
    required this.setIsMoreModal,
  });

  @override
  State<ReviewListItemWidget> createState() => _ReviewListItemWidgetState();
}

class _ReviewListItemWidgetState extends State<ReviewListItemWidget> {
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
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Stack(children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      width: 37,
                      height: 37,
                      decoration: const BoxDecoration(
                          color: CustomColor.lightGray3,
                          shape: BoxShape.circle),
                      child: widget.reviewData.profileUrl != null
                          ? CachedNetworkImage(
                              imageUrl: widget.reviewData.profileUrl!,
                              fit: BoxFit.cover,
                              memCacheWidth: 185,
                              errorWidget: (context, url, error) => const Icon(
                                Icons.error_outline_outlined,
                                color: CustomColor.brown1,
                              ),
                            )
                          : Transform.scale(
                              scale: 1.8,
                              child: const Image(
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
                          widget.reviewData.nickname,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: CustomColor.black2),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            StarRatingWidget(rate: widget.reviewData.rating),
                            const SizedBox(width: 8),
                            Text(
                                widget.reviewData.date
                                    .substring(0, 10)
                                    .replaceAll('-', '.'),
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
                        widget.reviewData.title,
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2),
                      ),
                    ),
                    if (widget.reviewData.images != null)
                      Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: ImagesSwiperWidget(
                              images: widget.reviewData.images)),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.88 - 100,
                      child: Text(
                        widget.reviewData.content,
                        style: const TextStyle(
                          fontSize: 12,
                          color: CustomColor.black2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 18)
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
                        onTap: () => Get.find<ReviewController>().onClickLike(
                            widget.index, widget.reviewData.id, true),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: LikeSVG(
                            color: widget.reviewData.recommendStatus == 'TRUE'
                                ? CustomColor.brown1
                                : CustomColor.lightGray2)),
                    const SizedBox(width: 4),
                    Text("${widget.reviewData.likes}",
                        style: const TextStyle(
                            fontSize: 11, color: CustomColor.gray)),
                    const SizedBox(width: 10),
                    InkWell(
                        onTap: () => Get.find<ReviewController>().onClickLike(
                            widget.index, widget.reviewData.id, false),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Transform.rotate(
                            angle: -3.14,
                            child: LikeSVG(
                                color:
                                    widget.reviewData.recommendStatus == 'FALSE'
                                        ? CustomColor.brown1
                                        : CustomColor.lightGray2))),
                    const SizedBox(width: 4),
                    Text("${widget.reviewData.dislikes}",
                        style: const TextStyle(
                            fontSize: 11, color: CustomColor.gray)),
                  ],
                )),
            if (widget.reviewData.writer)
              Positioned(
                  top: -4,
                  right: -11,
                  child: InkWell(
                      onTap: () {
                        Get.find<ReviewController>()
                            .setEditId(widget.reviewData.id);
                        widget.setIsMoreModal(true);
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: const Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                          child: TinyMoreSVG(color: CustomColor.lightGray2))))
          ]),
        ),
      ),
    );
  }
}
