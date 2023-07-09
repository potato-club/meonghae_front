import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_detail_screen/images_swiper_widget.dart';
import 'package:meonghae_front/widgets/svg/comment.dart';
import 'package:meonghae_front/widgets/svg/heart.dart';

class DetailContentWidget extends StatefulWidget {
  final Map<String, dynamic>? post;
  const DetailContentWidget({super.key, required this.post});

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
                clipBehavior: Clip.hardEdge,
                width: 37,
                height: 37,
                decoration: const BoxDecoration(
                    color: CustomColor.lightGray3, shape: BoxShape.circle),
                child: Transform.scale(
                  scale: 1.8,
                  child: widget.post?["profileUrl"] != null
                      ? Image.network(
                          widget.post?["profileUrl"],
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
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.88 - 49,
                child: Transform.translate(
                  offset: const Offset(0, 8),
                  child: Text(
                    widget.post?['title'] ?? 'No Title',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: CustomColor.black2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          widget.post?['images'] != null
              ? Column(children: [
                  const SizedBox(height: 20),
                  ImagesSwiperWidget(
                    images: (widget.post?['images']),
                  ),
                  const SizedBox(height: 30)
                ])
              : SizedBox(height: 18),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.88,
            child: Text(
              widget.post?['content'] ?? 'No Content',
              style: const TextStyle(fontSize: 12, height: 1.4),
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const HeartSVG(isFilled: false),
              const SizedBox(width: 4),
              Text("${widget.post?['likes']}",
                  style:
                      const TextStyle(fontSize: 13, color: CustomColor.gray)),
              const SizedBox(width: 12),
              const CommentSVG(),
              const SizedBox(width: 4),
              Text("${widget.post?['commentSize']}",
                  style:
                      const TextStyle(fontSize: 13, color: CustomColor.gray)),
            ],
          )
        ],
      ),
    );
  }
}
