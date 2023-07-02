import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/plus.dart';

class ImagesWidget extends StatefulWidget {
  final Function setWriteData;
  final Map<String, dynamic> writeData;
  const ImagesWidget(
      {super.key, required this.setWriteData, required this.writeData});

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
    return Row(
      children: [
        for (var image in widget.writeData["images"])
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.file(image!, fit: BoxFit.cover),
              ),
              const SizedBox(width: 14)
            ],
          ),
        if (widget.writeData["images"].length < 3)
          InkWell(
            onTap: pickImage,
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
