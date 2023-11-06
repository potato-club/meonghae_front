import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class ImagesSwiperWidget extends StatefulWidget {
  final List<dynamic>? images;
  const ImagesSwiperWidget({Key? key, required this.images}) : super(key: key);

  @override
  State<ImagesSwiperWidget> createState() => _ImagesSwiperWidgetState();
}

class _ImagesSwiperWidgetState extends State<ImagesSwiperWidget> {
  int currentSlideIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        clipBehavior: Clip.hardEdge,
        height: MediaQuery.of(context).size.width * 0.88,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.width * 0.88,
            initialPage: 0,
            enableInfiniteScroll: false,
            autoPlay: false,
            viewportFraction: 1.0,
            onPageChanged: (index, reason) =>
                setState(() => currentSlideIndex = index + 1),
          ),
          items: widget.images?.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    color: CustomColor.ivory2,
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Image.network(
                      item["fileUrl"],
                      fit: BoxFit.cover,
                    ));
              },
            );
          }).toList(),
        ),
      ),
      Positioned(
          top: 14,
          right: 14,
          child: Container(
            width: 36,
            height: 19,
            decoration: BoxDecoration(
                color: CustomColor.black1.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              '$currentSlideIndex/${widget.images?.length}',
              style: const TextStyle(
                fontSize: 11,
                letterSpacing: -0.3,
                color: CustomColor.white,
              ),
            )),
          ))
    ]);
  }
}
