import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/custom_modal_widget.dart';
import 'package:meonghae_front/widgets/svg/plus.dart';

class ImagesWidget extends StatefulWidget {
  final Function setWriteData;
  final Map<String, dynamic> writeData;
  final Function removeFocus;
  const ImagesWidget({
    super.key,
    required this.setWriteData,
    required this.writeData,
    required this.removeFocus,
  });

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        setState(() => widget.writeData["images"].add(File(pickedFile.path)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    void handleDeleteImage(int index) {
      List editImages = widget.writeData['images'];
      editImages.removeAt(index);
      widget.setWriteData('images', editImages);
      Navigator.pop(context);
      widget.removeFocus();
    }

    return Row(
      children: [
        for (int i = 0; i < widget.writeData["images"].length; i++)
          Row(
            children: [
              InkWell(
                onTap: () => CustomModalWidget.show(
                  context,
                  "사진을 삭제하시겠어요?",
                  () => handleDeleteImage(i),
                ),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Container(
                  width: 78,
                  height: 78,
                  clipBehavior: Clip.hardEdge,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.file(widget.writeData["images"][i]!,
                      fit: BoxFit.cover),
                ),
              ),
              const SizedBox(width: 14)
            ],
          ),
        if (widget.writeData["images"].length < 3)
          InkWell(
            onTap: pickImage,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: SizedBox(
              width: 80,
              height: 80,
              child: DottedBorder(
                  color: CustomColor.gray,
                  strokeWidth: 1,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  child: const Center(
                    child: PlusSVG(
                      color: CustomColor.gray,
                    ),
                  )),
            ),
          )
      ],
    );
  }
}
