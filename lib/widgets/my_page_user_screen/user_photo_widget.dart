import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';

class UserPhotoWidget extends StatefulWidget {
  final Map<String, dynamic> userInfo;
  final Function setImageFile;
  const UserPhotoWidget({
    super.key,
    required this.setImageFile,
    required this.userInfo,
  });

  @override
  State<UserPhotoWidget> createState() => _UserPhotoWidgetState();
}

class _UserPhotoWidgetState extends State<UserPhotoWidget> {
  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        widget.setImageFile(File(pickedFile.path));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Center(
        child: Container(
          width: 98,
          height: 98,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              color: CustomColor.ivory2, shape: BoxShape.circle),
          child: widget.userInfo['file'] != null
              ? CircleAvatar(
                  backgroundImage: FileImage(widget.userInfo['file']),
                  radius: 75,
                )
              : widget.userInfo['image'] != null
                  ? Image.network(widget.userInfo['image'], fit: BoxFit.cover)
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
        left: MediaQuery.of(context).size.width * 0.44 + 20,
        bottom: 0,
        child: SizedBox(
          width: 30,
          height: 30,
          child: FloatingActionButton(
              elevation: 0,
              backgroundColor: CustomColor.white.withOpacity(0.8),
              onPressed: _pickImage,
              child: Transform.scale(
                  scale: 0.88,
                  child: const PencilSVG(color: CustomColor.gray))),
        ),
      )
    ]);
  }
}
