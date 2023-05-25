import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:image_picker/image_picker.dart';

class UserPhotoWidget extends StatefulWidget {
  final Function setImageFile;
  const UserPhotoWidget({super.key, required this.setImageFile});

  @override
  State<UserPhotoWidget> createState() => _UserPhotoWidgetState();
}

class _UserPhotoWidgetState extends State<UserPhotoWidget> {
  @override
  Widget build(BuildContext context) {
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

    return Stack(children: [
      Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.35,
          height: MediaQuery.of(context).size.width * 0.35,
          decoration: const BoxDecoration(
              color: CustomColor.white, shape: BoxShape.circle),
          child: Transform.scale(
            scale: 1.8,
            child: imageFile != null
                ? CircleAvatar(
                    backgroundImage: FileImage(imageFile!),
                    radius: 75,
                  )
                : const Image(
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
            child: const Icon(
              Icons.edit,
              color: CustomColor.gray,
              size: 22,
            ),
          ),
        ),
      )
    ]);
  }
}
