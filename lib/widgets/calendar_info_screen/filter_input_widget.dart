import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/filter_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/bottom_arrow.dart';

class FilterInputWidget extends StatefulWidget {
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
  final Function setValue;
  final List<dynamic> list;
  const FilterInputWidget({
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
  });

  @override
  State<FilterInputWidget> createState() => _FilterInputWidgetState();
}

class _FilterInputWidgetState extends State<FilterInputWidget> {
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
            child: FilterModalWidget(
              isOpen: isOpen,
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
    return Row(
      children: [
        CompositedTransformTarget(
          link: _selectLink,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.88 - 94,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22),
                child: Text(value ?? '예방접종',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.black2)),
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        InkWell(
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
            width: 80,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('필터',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.gray)),
                SizedBox(width: 8),
                BottomArrowSVG(size: 12, color: CustomColor.gray)
              ],
            ),
          ),
        )
      ],
    );
  }
}
