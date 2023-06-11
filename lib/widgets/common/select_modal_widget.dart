import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class SelectModalWidget extends StatefulWidget {
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
  const SelectModalWidget({
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
  });

  @override
  State<SelectModalWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectModalWidget>
    with SingleTickerProviderStateMixin {
  String? lateValue;
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    lateValue = widget.value;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    final Animation<double> curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    );
    _animation = Tween<double>(begin: 0, end: widget.height).animate(curve);
    if (widget.isOpen) {
      _animationController.forward();
    }
    _scrollController = ScrollController(
        initialScrollOffset: !widget.list.contains(widget.value)
            ? 0
            : widget.list.indexOf(widget.value) * 30);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildItem(String value) {
    return GestureDetector(
      onTap: () {
        setState(() => lateValue = value);
        widget.setValue(value);
      },
      child: Container(
        height: widget.itemHeight,
        color: value == lateValue ? CustomColor.lightGray1 : CustomColor.white,
        child: Center(
            child: Text(
          value,
          style: TextStyle(
              fontSize: widget.fontSize,
              color: value == lateValue ? CustomColor.gray : CustomColor.black2,
              fontWeight: FontWeight.w400),
        )),
      ),
    );
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
          offset: Offset(0, widget.term),
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: _animation.value,
                  width: widget.width,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(widget.borderRadius)),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(
                          widget.list.length, (i) => buildItem(widget.list[i])),
                    ),
                  ),
                );
              }),
        ),
      ),
    ]);
  }
}
