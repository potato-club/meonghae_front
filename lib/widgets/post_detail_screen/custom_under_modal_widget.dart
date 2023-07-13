import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';

class CustomUnderModalWidget extends StatefulWidget {
  final bool isOpen;
  final Function onClose;
  final String label1;
  final String label2;
  final Function func1;
  final Function func2;
  const CustomUnderModalWidget(
      {super.key,
      required this.isOpen,
      required this.onClose,
      required this.label1,
      required this.label2,
      required this.func1,
      required this.func2});

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
                        height: 175,
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
                            const SizedBox(height: 12),
                            Center(
                              child: Container(
                                  width: 40,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: CustomColor.lightGray1,
                                    borderRadius: BorderRadius.circular(2),
                                  )),
                            ),
                            InkWell(
                              onTap: () => widget.func1(),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 30,
                                    bottom: 23,
                                    left: MediaQuery.of(context).size.width *
                                        0.07),
                                child: Text(
                                  widget.label1,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: CustomColor.black2),
                                ),
                              ),
                            ),
                            Container(
                              height: 1,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                  color: CustomColor.lightGray1),
                            ),
                            InkWell(
                              onTap: () => widget.func2(),
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: 25,
                                    bottom: 30,
                                    left: MediaQuery.of(context).size.width *
                                        0.07),
                                child: Text(
                                  widget.label2,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                      color: CustomColor.black2),
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
