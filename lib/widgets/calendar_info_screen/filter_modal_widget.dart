import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class FilterModalWidget extends StatefulWidget {
  final bool isOpen;
  final List<dynamic> list;
  final LayerLink selectLink;
  final String? value;
  final Function setValue;
  const FilterModalWidget({
    super.key,
    required this.isOpen,
    required this.list,
    required this.selectLink,
    required this.setValue,
    required this.value,
  });

  @override
  State<FilterModalWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterModalWidget>
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
    _animation = Tween<double>(begin: 0, end: 180).animate(curve);
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
          height: 45,
          color:
              value == lateValue ? CustomColor.lightGray1 : CustomColor.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 14,
                    color: value == lateValue
                        ? CustomColor.gray
                        : CustomColor.black2,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )),
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
          offset: const Offset(0, 54),
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: _animation.value,
                  width: MediaQuery.of(context).size.width * 0.88 - 94,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
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
