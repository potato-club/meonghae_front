import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/date_select_modal_widget.dart';
import 'package:meonghae_front/widgets/calendar_info_screen/time_select_modal_widget.dart';

enum DialType { DATE, TIME }

class DialBoxWidget extends StatefulWidget {
  final Function onSave;
  final DialType dialType;
  final DateTime scheduleTime;
  final String label;
  final TextAlign textAlign;
  const DialBoxWidget({
    super.key,
    required this.onSave,
    required this.dialType,
    required this.scheduleTime,
    required this.label,
    required this.textAlign,
  });

  @override
  State<DialBoxWidget> createState() => _DialBoxWidgetState();
}

class _DialBoxWidgetState extends State<DialBoxWidget> {
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

  void handleClose() {
    _overlayEntry!.remove();
    setState(() => isOpen = false);
  }

  Widget buildDialWidget() {
    switch (widget.dialType) {
      case DialType.DATE:
        return DateSelectModalWidget(
          scheduleTime: widget.scheduleTime,
          onSave: widget.onSave,
          handleClose: handleClose,
        );
      case DialType.TIME:
        return TimeSelectModalWidget(
          onSave: widget.onSave,
          scheduleTime: widget.scheduleTime,
          handleClose: handleClose,
        );
      default:
        return Container();
    }
  }

  OverlayEntry _createOverlayEntry() {
    return OverlayEntry(
      builder: (context) {
        return Positioned.fill(child: buildDialWidget());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      child: SizedBox(
        width: 75,
        child: Text(
          widget.label,
          textAlign: widget.textAlign,
          style: const TextStyle(
            fontSize: 13,
            color: CustomColor.gray,
          ),
        ),
      ),
    );
  }
}
