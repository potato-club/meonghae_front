import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class DogPhotoWidget extends StatefulWidget {
  final String? initImage;
  final Function setImageFile;
  const DogPhotoWidget(
      {super.key, required this.setImageFile, required this.initImage});

  @override
  State<DogPhotoWidget> createState() => _DogPhotoWidgetState();
}

class _DogPhotoWidgetState extends State<DogPhotoWidget> {
  File? imageFile;
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        widget.setImageFile(imageFile);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
          width: 130,
          height: 130,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: CustomColor.ivory2, shape: BoxShape.circle),
          child: imageFile != null
              ? CircleAvatar(
                  backgroundImage: FileImage(imageFile!),
                  radius: 75,
                )
              : widget.initImage != null
                  ? Image.network(widget.initImage!, fit: BoxFit.cover)
                  : Transform.scale(
                      scale: 1.8,
                      child: const Image(
                        image: AssetImage(
                          'assets/images/dog_pictures/face.png',
                        ),
                      ),
                    ),
        ),
      ),
      Positioned(
        left: MediaQuery.of(context).size.width * 0.5 + 30,
        bottom: 0,
        child: SizedBox(
          width: 34,
          height: 34,
          child: FloatingActionButton(
              elevation: 0,
              backgroundColor: CustomColor.white.withOpacity(0.8),
              onPressed: _pickImage,
              child: const PencilSVG(color: CustomColor.gray)),
        ),
      )
    ]);
  }
}
