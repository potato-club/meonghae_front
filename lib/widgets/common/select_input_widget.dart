import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/select_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/bottom_arrow.dart';
import 'package:meonghae_front/widgets/svg/tiny_bottom_arrow.dart';

class SelectInputWidget extends StatefulWidget {
  final double width;
  final double height;
  final double listHeight;
  final double fontSize;
  final double itemHeight;
  final double borderRadius;
  final String? defaultValue;
  final String? hintText;
  final TextAlign textAlign;
  final bool isBigIcon;
  final bool isBold;
  final Function setValue;
  final List<dynamic> list;
  const SelectInputWidget({
    super.key,
    required this.width,
    required this.height,
    required this.itemHeight,
    required this.list,
    required this.listHeight,
    this.isBigIcon = false,
    this.defaultValue,
    required this.setValue,
    this.hintText,
    this.borderRadius = 5,
    this.fontSize = 12,
    this.textAlign = TextAlign.center,
    this.isBold = false,
  });

  @override
  State<SelectInputWidget> createState() => _SelectInputWidgetState();
}

class _SelectInputWidgetState extends State<SelectInputWidget> {
  final LayerLink _selectLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool isOpen = false;
  String? value;

  @override
  void initState() {
    super.initState();
    value = widget.defaultValue;
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
            child: SelectModalWidget(
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
              setValue: (String data) {
                widget.setValue(data);
                setState(() => value = data);
              },
              value: value,
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
            FocusScope.of(context).unfocus();
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(widget.borderRadius),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: widget.isBigIcon ? 22 : 14,
                      right: widget.isBigIcon ? 12 : 8),
                  child: Text(
                    (value == '' || value == null)
                        ? (widget.hintText ?? "")
                        : value!,
                    textAlign: widget.textAlign,
                    style: TextStyle(
                      fontSize: widget.fontSize,
                      color: (value == '' || value == null)
                          ? CustomColor.gray
                          : CustomColor.black2,
                      letterSpacing: (value == '' || value == null) ? -1 : null,
                      fontWeight: widget.isBold ? FontWeight.w700 : null,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: widget.isBigIcon ? 16 : 8),
                child: widget.isBigIcon
                    ? const BottomArrowSVG(size: 12, color: CustomColor.gray)
                    : const TinyBottomArrowSVG(strokeColor: CustomColor.black2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
