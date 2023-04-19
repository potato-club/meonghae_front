import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterImage extends StatefulWidget {
  const RegisterImage({super.key});

  @override
  _RegisterImageState createState() => _RegisterImageState();
}

class _RegisterImageState extends State<RegisterImage> {
  File? _imageFile;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
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
                color: Colors.white.withOpacity(0.5),
                child: _imageFile != null
                    ? CircleAvatar(
                        backgroundImage: FileImage(_imageFile!),
                        radius: 75,
                      )
                    : const Icon(
                        Icons.add,
                        size: 50,
                        color: Color(0xff999999),
                      ),
              ),
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
              backgroundColor: Colors.white.withOpacity(0.8),
              onPressed: _pickImage,
              child: const Icon(
                Icons.edit,
                color: Color(0xff999999),
                size: 22,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
