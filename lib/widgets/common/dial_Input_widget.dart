import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/dial_modal_widget.dart';

class DialInputWidget extends StatefulWidget {
  final double width;
  final double height;
  final double listHeight;
  final double fontSize;
  final Color color;
  final Color bgColor;
  final Color? strColor;
  final double itemHeight;
  final double borderRadius;
  final String defaultValue;
  final TextAlign textAlign;
  final bool isBigIcon;
  final bool isBold;
  final Function setValue;
  final List<dynamic> list;
  const DialInputWidget({
    super.key,
    required this.width,
    required this.height,
    required this.itemHeight,
    required this.list,
    required this.listHeight,
    this.isBigIcon = false,
    required this.defaultValue,
    required this.setValue,
    this.borderRadius = 5,
    this.fontSize = 12,
    this.textAlign = TextAlign.center,
    this.isBold = false,
    this.color = CustomColor.black2,
    this.bgColor = CustomColor.white,
    this.strColor,
  });

  @override
  State<DialInputWidget> createState() => _DialInputWidgetState();
}

class _DialInputWidgetState extends State<DialInputWidget> {
  final LayerLink _selectLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    _overlayEntry = _createOverlayEntry();
  }

  @override
  void dispose() {
    _overlayEntry!.dispose();
    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: GestureDetector(
            onTap: () {
              _overlayEntry!.remove();
              setState(() {
                isOpen = false;
              });
            },
            child: DialModalWidget(
              term: widget.isBigIcon ? widget.height + 9 : widget.height + 6,
              isOpen: isOpen,
              width: widget.width,
              height: widget.listHeight,
              itemHeight: widget.itemHeight,
              fontSize: widget.fontSize,
              borderRadius: widget.borderRadius,
              list: widget.list,
              textAlign: widget.textAlign,
              isBold: widget.isBold,
              selectLink: _selectLink,
              setValue: widget.setValue,
              value: widget.defaultValue,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _selectLink,
      child: InkWell(
        onTap: () {
          setState(() {
            isOpen = !isOpen;
          });
          if (isOpen) {
            Overlay.of(context).insert(_overlayEntry!);
          } else {
            _overlayEntry!.remove();
          }
        },
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.bgColor,
            border: widget.strColor != null
                ? Border.all(color: widget.strColor!, width: 1)
                : null,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Center(
            child: Text(
              widget.defaultValue,
              textAlign: widget.textAlign,
              style: TextStyle(
                fontSize: widget.fontSize,
                color: CustomColor.gray,
                fontWeight: widget.isBold ? FontWeight.w700 : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
