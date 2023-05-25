import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/main_screen.dart';
import 'package:meonghae_front/screens/register_dog_screen.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_registered_photo_widget.dart';

import '../themes/customColor.dart';

class RegisteredUserScreen extends StatefulWidget {
  final bool hasAnimal;
  final File? imageFile;
  final String name;
  const RegisteredUserScreen(
      {super.key,
      required this.imageFile,
      required this.name,
      required this.hasAnimal});

  @override
  State<RegisteredUserScreen> createState() => _RegisteredUserScreenState();
}

class _RegisteredUserScreenState extends State<RegisteredUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColor.brown1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          UserRegisteredPhotoWidget(imageFile: widget.imageFile),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.125,
          ),
          Column(
            children: [
              const Text(
                '안녕하세요',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Text(
                '${widget.name} 님!',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.016,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '수정하기',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: CustomColor.white,
                      ),
                    ),
                    Transform.translate(
                      offset: const Offset(-2, 1),
                      child: const Icon(Icons.keyboard_arrow_right_rounded,
                          size: 22, color: CustomColor.white),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.22,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.145),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(288, 49),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: CustomColor.black2,
              ),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => widget.hasAnimal
                      ? const RegisterDogScreen()
                      : const MainScreen())),
              child: const Text(
                '다음',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
