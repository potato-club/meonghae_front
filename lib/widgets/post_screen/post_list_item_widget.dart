import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/post_detail_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/tiny_comment.dart';
import 'package:meonghae_front/widgets/svg/tiny_heart.dart';
import 'package:meonghae_front/widgets/svg/tiny_picture.dart';

class PostListItemWidget extends StatefulWidget {
  final Map<String, dynamic> postData;
  final String currentSection;
  final Function fetchData;
  const PostListItemWidget({
    super.key,
    required this.postData,
    required this.currentSection,
    required this.fetchData,
  });

  @override
  State<PostListItemWidget> createState() => _PostListItemWidgetState();
}

class _PostListItemWidgetState extends State<PostListItemWidget> {
  @override
  Widget build(BuildContext context) {
    final bool hasToken = widget.postData['hasToken'] as bool? ?? false;
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => PostDetailScreen(
                id: widget.postData['id'],
                currentSection: widget.currentSection,
                fetchData: widget.fetchData,
              ))),
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
                child: Transform.scale(
                  scale: 1.8,
                  child: widget.postData["profileUrl"] != null
                      ? Image.network(
                          widget.postData["profileUrl"],
                          fit: BoxFit.cover,
                        )
                      : const Image(
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
                      widget.postData['title'],
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.postData['content'],
                      overflow: TextOverflow.ellipsis,
                      maxLines: widget.currentSection == '실종신고' ? 4 : 2,
                      style: const TextStyle(
                        fontSize: 11,
                        color: CustomColor.black2,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const TinyHeartSVG(),
                        const SizedBox(width: 2),
                        Text(
                          '${widget.postData['likes']}',
                          style: const TextStyle(
                              fontSize: 11, color: CustomColor.gray),
                        ),
                        const SizedBox(width: 6),
                        const TinyCommentSVG(),
                        const SizedBox(width: 2),
                        Text(
                          '${widget.postData['commentSize']}',
                          style: const TextStyle(
                              fontSize: 11, color: CustomColor.gray),
                        ),
                        const SizedBox(width: 6),
                        if (hasToken) const TinyPictureSVG()
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
