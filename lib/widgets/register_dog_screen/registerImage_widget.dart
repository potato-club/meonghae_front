import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/svg/big_plus.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class RegisterImage extends StatefulWidget {
  final num index;
  final File? imageFile;
  final Function setData;
  const RegisterImage(
      {super.key, this.imageFile, required this.setData, required this.index});

  @override
  _RegisterImageState createState() => _RegisterImageState();
}

class _RegisterImageState extends State<RegisterImage> {
  File? imageFile;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        widget.setData(widget.index, 'imageFile', imageFile);
      }
    });
  }

  @override
  void initState() {
    imageFile = widget.imageFile;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 145,
          height: 145,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5.0,
                sigmaY: 5.0,
              ),
              child: Container(
                  color: CustomColor.white.withOpacity(0.5),
                  child: imageFile != null
                      ? CircleAvatar(
                          backgroundImage: FileImage(imageFile!),
                          radius: 75,
                        )
                      : const Center(
                          child: SizedBox(
                              width: 31, height: 31, child: BigPlusSVG()))),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 115,
          child: SizedBox(
            width: 34,
            height: 34,
            child: FloatingActionButton(
                elevation: 0,
                backgroundColor: CustomColor.white.withOpacity(0.8),
                onPressed: _pickImage,
                child: const PencilSVG(color: CustomColor.gray)),
          ),
        ),
      ],
    );
  }
}
