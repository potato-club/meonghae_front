import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class SelectModalWidget extends StatefulWidget {
  final bool isOpen;
  final double height;
  final double itemHeight;
  final double term;
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
  });

  @override
  State<SelectModalWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectModalWidget>
    with SingleTickerProviderStateMixin {
  String? lateValue;
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
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget buildItem(String value) {
    return GestureDetector(
      onTap: () {
        setState(() => lateValue = value);
        widget.setValue(value);
      },
      child: Container(
        height: 30,
        color: value == lateValue ? CustomColor.lightGray1 : CustomColor.white,
        child: Center(
            child: Text(
          value,
          style: TextStyle(
              fontSize: 12,
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
                      borderRadius: BorderRadius.circular(5)),
                  child: SingleChildScrollView(
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
