import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/plus.dart';

class ImagesWidget extends StatefulWidget {
  const ImagesWidget({super.key});

  @override
  State<ImagesWidget> createState() => _ImagesWidgetState();
}

class _ImagesWidgetState extends State<ImagesWidget> {
  List<File?> images = [];
  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        images.add(File(pickedFile.path));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var image in images)
          Row(
            children: [
              Container(
                width: 78,
                height: 78,
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.file(image!, fit: BoxFit.cover),
              ),
              SizedBox(width: 14)
            ],
          ),
        if (images.length < 3)
          InkWell(
            onTap: pickImage,
            child: SizedBox(
              width: 78,
              height: 78,
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
