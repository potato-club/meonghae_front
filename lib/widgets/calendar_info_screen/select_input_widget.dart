import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/select_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/bottom_arrow.dart';
import 'package:meonghae_front/widgets/svg/tiny_bottom_arrow.dart';

class SelectInputWidget extends StatefulWidget {
  final String? defaultValue;
  final Function setValue;
  final List<dynamic> list;
  const SelectInputWidget({
    super.key,
    required this.list,
    this.defaultValue,
    required this.setValue,
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

  void closeModal() {
    _overlayEntry!.remove();
    setState(() {
      isOpen = false;
    });
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned.fill(
          child: GestureDetector(
            onTap: () => closeModal(),
            child: SelectModalWidget(
              isOpen: isOpen,
              list: widget.list,
              selectLink: _selectLink,
              setValue: (String data) {
                widget.setValue(data);
                setState(() => value = data);
              },
              value: value,
              closeModal: closeModal,
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
          width: MediaQuery.of(context).size.width * 0.88,
          height: 45,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 22, right: 12),
                  child: Text(
                    value ?? '',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          value == null ? CustomColor.gray : CustomColor.black2,
                      letterSpacing: value == null ? -1 : null,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(right: 16),
                  child:
                      const BottomArrowSVG(size: 12, color: CustomColor.gray)),
            ],
          ),
        ),
      ),
    );
  }
}
