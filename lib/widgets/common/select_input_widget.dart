import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/select_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/tiny_bottom_arrow.dart';

class SelectInputWidget extends StatefulWidget {
  final double width;
  final double height;
  final double listHeight;
  final double itemHeight;
  final String? defaultValue;
  final String? hintText;
  final bool isCenter;
  final bool isIcon;
  final Function setValue;
  final List<dynamic> list;
  const SelectInputWidget({
    super.key,
    required this.width,
    required this.height,
    required this.itemHeight,
    required this.list,
    required this.listHeight,
    this.isCenter = true,
    this.isIcon = true,
    this.defaultValue,
    required this.setValue,
    this.hintText,
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
    _overlayEntry!.remove();
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
              term: widget.height + 6,
              isOpen: isOpen,
              width: widget.width,
              height: widget.listHeight,
              itemHeight: widget.itemHeight,
              list: widget.list,
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
            Overlay.of(context).insert(_overlayEntry!);
          } else {
            _overlayEntry!.remove();
          }
        },
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Text(
                    value ?? (widget.hintText ?? ""),
                    textAlign:
                        widget.isCenter ? TextAlign.center : TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          value == null ? CustomColor.gray : CustomColor.black2,
                      letterSpacing: value == null ? -1 : null,
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: TinyBottomArrowSVG(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}