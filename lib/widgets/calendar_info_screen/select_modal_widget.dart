import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class SelectModalWidget extends StatefulWidget {
  final bool isOpen;
  final List<dynamic> list;
  final LayerLink selectLink;
  final String? value;
  final Function setValue;
  final Function closeModal;
  const SelectModalWidget({
    super.key,
    required this.isOpen,
    required this.list,
    required this.selectLink,
    required this.setValue,
    required this.value,
    required this.closeModal,
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
    _animation =
        Tween<double>(begin: 0, end: 45.0 * widget.list.length).animate(curve);
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
        widget.closeModal();
      },
      child: Container(
        height: 45,
        color: value == lateValue ? CustomColor.brown1 : CustomColor.white,
        child: Padding(
          padding: const EdgeInsets.only(left: 22),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 14,
                  color: value == lateValue
                      ? CustomColor.black2
                      : CustomColor.black2,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
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
          offset: const Offset(0, 54),
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Container(
                  height: _animation.value,
                  width: MediaQuery.of(context).size.width * 0.88,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: CustomColor.black1.withOpacity(0.12),
                            offset: const Offset(0, 4),
                            blurRadius: 8,
                            spreadRadius: 0)
                      ]),
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
