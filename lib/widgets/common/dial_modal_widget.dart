import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class DialModalWidget extends StatefulWidget {
  final bool isOpen;
  final double height;
  final double itemHeight;
  final double term;
  final double fontSize;
  final double borderRadius;
  final List<dynamic> list;
  final LayerLink selectLink;
  final String? value;
  final Function setValue;
  final double? width;
  final TextAlign textAlign;
  final bool isBold;
  final Color color;
  const DialModalWidget({
    super.key,
    required this.isOpen,
    required this.height,
    required this.list,
    required this.itemHeight,
    required this.selectLink,
    this.width,
    required this.term,
    required this.setValue,
    required this.value,
    required this.fontSize,
    required this.borderRadius,
    this.textAlign = TextAlign.center,
    this.isBold = false,
    this.color = CustomColor.black2,
  });

  @override
  State<DialModalWidget> createState() => _DialWidgetState();
}

class _DialWidgetState extends State<DialModalWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.list.indexOf(widget.value);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final Animation<double> curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    );
    _animation = Tween<double>(begin: widget.itemHeight, end: widget.height)
        .animate(curve);
    if (widget.isOpen) {
      _animationController.forward();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
          child: Container(
        decoration: const BoxDecoration(color: Colors.transparent),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      )),
      Positioned(
        child: CompositedTransformFollower(
          link: widget.selectLink,
          offset: Offset(0, -(widget.height / 2 - widget.itemHeight / 2)),
          child: SizedBox(
            height: widget.height,
            width: widget.width,
            child: Center(
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Center(
                      child: Container(
                          height: _animation.value,
                          width: widget.width,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.circular(widget.borderRadius),
                              boxShadow: [
                                BoxShadow(
                                    color: CustomColor.black1.withOpacity(0.12),
                                    offset: const Offset(0, 4),
                                    blurRadius: 8,
                                    spreadRadius: 0)
                              ]),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 148,
                              scrollDirection: Axis.vertical,
                              viewportFraction:
                                  1 / (widget.height / widget.itemHeight),
                              enableInfiniteScroll: false,
                              initialPage: currentIndex,
                              onPageChanged: (index, reason) {
                                setState(() => currentIndex = index);
                                widget.setValue(widget.list[index]);
                              },
                            ),
                            items: widget.list
                                .map((e) => SizedBox(
                                      width: widget.width,
                                      height: widget.itemHeight,
                                      child: Center(
                                        child: Text(
                                          e,
                                          style: TextStyle(
                                              decoration: TextDecoration.none,
                                              fontSize: widget.fontSize,
                                              fontWeight: FontWeight.normal,
                                              color:
                                                  widget.list[currentIndex] == e
                                                      ? widget.color
                                                      : CustomColor.black2),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          )),
                    );
                  }),
            ),
          ),
        ),
      ),
      Positioned(
        child: CompositedTransformFollower(
          link: widget.selectLink,
          offset: const Offset(0, 0),
          child: IgnorePointer(
            ignoring: true,
            child: Container(
              height: widget.itemHeight,
              width: widget.width,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: CustomColor.brown1, width: 1),
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
      )
    ]);
  }
}
