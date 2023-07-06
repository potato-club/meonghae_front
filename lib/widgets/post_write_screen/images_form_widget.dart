import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/camera.dart';

class ImagesFormWidget extends StatefulWidget {
  final Map<String, dynamic> writeData;
  final Function setWriteData;
  const ImagesFormWidget({
    super.key,
    required this.writeData,
    required this.setWriteData,
  });

  @override
  State<ImagesFormWidget> createState() => _ImagesFormWidgetState();
}

class _ImagesFormWidgetState extends State<ImagesFormWidget> {
  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        setState(() => widget.writeData['images'].add(File(pickedFile.path)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.06),
        child: Row(
          children: [
            if (widget.writeData['images'].length < 5)
              Padding(
                padding: const EdgeInsets.only(right: 14),
                child: InkWell(
                  onTap: pickImage,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: CustomColor.lightGray1, width: 1.0)),
                    width: 80,
                    height: 80,
                    child: const Center(child: CameraSVG()),
                  ),
                ),
              ),
            for (int i = 0; i < widget.writeData['images'].length; i++)
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: i != 0 ? 14 : 0),
                    child: Container(
                      width: 80,
                      height: 80,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.file(widget.writeData['images'][i],
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
