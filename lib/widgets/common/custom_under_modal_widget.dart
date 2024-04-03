import 'package:flutter/material.dart';
import 'package:meonghae_front/models/custom_under_modal_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class CustomUnderModalWidget extends StatefulWidget {
  final List<CustomUnderModalModel> modalList;
  final bool isOpen;
  final Function onClose;
  const CustomUnderModalWidget(
      {super.key,
      required this.modalList,
      required this.isOpen,
      required this.onClose});

  @override
  State<CustomUnderModalWidget> createState() => _CustomUnderModalWidgetState();
}

class _CustomUnderModalWidgetState extends State<CustomUnderModalWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    );
    if (widget.isOpen) {
      _animationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant CustomUnderModalWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => widget.onClose(),
        child: Container(
          decoration: const BoxDecoration(color: Colors.transparent),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(
                      0,
                      MediaQuery.of(context).size.height *
                          (1 - _animation.value)),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 32 + widget.modalList.length * 65,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24),
                            topRight: Radius.circular(24),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: CustomColor.black1.withOpacity(0.20),
                                offset: const Offset(0, 4),
                                blurRadius: 20,
                                spreadRadius: 0)
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Center(
                                child: Container(
                                    width: 40,
                                    height: 4,
                                    decoration: BoxDecoration(
                                      color: CustomColor.lightGray1,
                                      borderRadius: BorderRadius.circular(2),
                                    )),
                              ),
                            ),
                            for (int i = 0; i < widget.modalList.length; i++)
                              GestureDetector(
                                onTap: () {
                                  widget.modalList[i].onClick();
                                  widget.onClose();
                                },
                                child: Container(
                                  height: i == widget.modalList.length - 1
                                      ? 77
                                      : 65,
                                  decoration: BoxDecoration(
                                      border: i == widget.modalList.length - 1
                                          ? null
                                          : const Border(
                                              bottom: BorderSide(
                                              width: 1,
                                              color: CustomColor.lightGray1,
                                            ))),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      28,
                                      0,
                                      28,
                                      0,
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        widget.modalList[i].label,
                                        style: const TextStyle(
                                          fontSize: 13,
                                          color: CustomColor.black2,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )),
                );
              }),
        ));
  }
}
