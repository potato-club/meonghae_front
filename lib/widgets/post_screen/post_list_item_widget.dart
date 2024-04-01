import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/models/post_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/svg/tiny_comment.dart';
import 'package:meonghae_front/widgets/svg/tiny_heart.dart';
import 'package:meonghae_front/widgets/svg/tiny_picture.dart';

class PostListItemWidget extends StatefulWidget {
  final PostModel postData;
  const PostListItemWidget({
    super.key,
    required this.postData,
  });

  @override
  State<PostListItemWidget> createState() => _PostListItemWidgetState();
}

class _PostListItemWidgetState extends State<PostListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: 8, horizontal: MediaQuery.of(context).size.width * 0.06),
      child: GestureDetector(
        onTap: () {
          Get.find<PostDetailController>().setId(widget.postData.id);
          Get.toNamed(AppRoutes.postDetail);
        },
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.hardEdge,
                  width: 37,
                  height: 37,
                  decoration: const BoxDecoration(
                      color: CustomColor.lightGray3, shape: BoxShape.circle),
                  child: widget.postData.profileUrl != null
                      ? CachedNetworkImage(
                          imageUrl: widget.postData.profileUrl!,
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
                const SizedBox(width: 16),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.88 - 87,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        widget.postData.title,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      GetX<PostController>(builder: (controller) {
                        return Text(
                          widget.postData.content,
                          overflow: TextOverflow.ellipsis,
                          maxLines: controller.type.value == 3 ? 4 : 2,
                          style: const TextStyle(
                            fontSize: 12,
                            color: CustomColor.black2,
                          ),
                        );
                      }),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.postData.date
                                    .split('T')[0]
                                    .replaceAll('-', '/'),
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: CustomColor.lightGray2),
                              ),
                              const SizedBox(width: 6),
                              Text(
                                widget.postData.date
                                    .split('T')[1]
                                    .substring(0, 5),
                                style: const TextStyle(
                                    fontSize: 11,
                                    color: CustomColor.lightGray2),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const TinyHeartSVG(),
                              const SizedBox(width: 3),
                              Text(
                                '${widget.postData.likes}',
                                style: const TextStyle(
                                    fontSize: 11, color: CustomColor.gray),
                              ),
                              const SizedBox(width: 6),
                              const TinyCommentSVG(),
                              const SizedBox(width: 3),
                              Text(
                                '${widget.postData.commentSize}',
                                style: const TextStyle(
                                    fontSize: 11, color: CustomColor.gray),
                              ),
                              if (widget.postData.hasImage)
                                const Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: TinyPictureSVG(),
                                )
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
