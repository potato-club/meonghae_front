import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/images_swiper_widget.dart';
import 'package:meonghae_front/widgets/svg/comment.dart';
import 'package:meonghae_front/widgets/svg/heart.dart';
import 'package:meonghae_front/widgets/svg/tiny_heart.dart';

class DetailContentWidget extends StatefulWidget {
  const DetailContentWidget({super.key});

  @override
  State<DetailContentWidget> createState() => _DetailContentWidgetState();
}

class _DetailContentWidgetState extends State<DetailContentWidget> {
  @override
  Widget build(BuildContext context) {
    return GetX<PostDetailController>(builder: (controller) {
      if (controller.isLoading.value) {
        return SizedBox(height: 0);
      } else {
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
            horizontal: MediaQuery.of(context).size.width * 0.06,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    clipBehavior: Clip.hardEdge,
                    width: 37,
                    height: 37,
                    decoration: const BoxDecoration(
                        color: CustomColor.lightGray3, shape: BoxShape.circle),
                    child: controller.post.value.profileUrl != null
                        ? Image.network(
                            controller.post.value.profileUrl!,
                            fit: BoxFit.cover,
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.88 - 49,
                    child: Text(
                      controller.post.value.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2,
                      ),
                    ),
                  ),
                ],
              ),
              if (controller.post.value.images != null)
                Column(children: [
                  const SizedBox(height: 20),
                  ImagesSwiperWidget(images: controller.post.value.images),
                ]),
              const SizedBox(height: 18),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: Text(
                  controller.post.value.content,
                  style: const TextStyle(fontSize: 14, height: 1.3),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    controller.post.value.date
                        .split('T')[0]
                        .replaceAll('-', '/'),
                    style: const TextStyle(
                        fontSize: 11, color: CustomColor.lightGray2),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    controller.post.value.date.split('T')[1].substring(0, 5),
                    style: const TextStyle(
                        fontSize: 11, color: CustomColor.lightGray2),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => controller.onClickHeart(),
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    child: Row(
                      children: [
                        controller.post.value.likeStatus
                            ? const SizedBox(
                                width: 15, height: 15, child: TinyHeartSVG())
                            : const HeartSVG(isFilled: false),
                        const SizedBox(width: 6),
                        Text("${controller.post.value.likes}",
                            style: const TextStyle(
                                fontSize: 14, color: CustomColor.gray)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const CommentSVG(),
                  const SizedBox(width: 6),
                  Text("${controller.comments.length}",
                      style: const TextStyle(
                          fontSize: 14, color: CustomColor.gray)),
                ],
              )
            ],
          ),
        );
      }
    });
  }
}
