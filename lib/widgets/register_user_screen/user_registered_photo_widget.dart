import 'dart:io';

import 'package:flutter/material.dart';

import '../../themes/custom_color.dart';

class UserRegisteredPhotoWidget extends StatefulWidget {
  final File? imageFile;
  const UserRegisteredPhotoWidget({super.key, required this.imageFile});

  @override
  State<UserRegisteredPhotoWidget> createState() =>
      _UserRegisteredPhotoWidgetState();
}

class _UserRegisteredPhotoWidgetState extends State<UserRegisteredPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.width * 0.35,
        decoration: const BoxDecoration(
            color: CustomColor.white, shape: BoxShape.circle),
        child: widget.imageFile != null
            ? CircleAvatar(
                backgroundImage: FileImage(widget.imageFile!),
                radius: 75,
              )
            : Transform.scale(
                scale: 1.8,
                child: const Image(
                  image: AssetImage(
                    'assets/images/dog_pictures/face.png',
                  ),
                ),
              ),
      ),
    );
  }
}
