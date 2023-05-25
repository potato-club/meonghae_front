import 'dart:io';
import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/registered_user_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_form_widget.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_photo_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class RegisterUserScreen extends StatefulWidget {
  final bool hasAnimal;
  const RegisterUserScreen({super.key, required this.hasAnimal});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final formKey = GlobalKey<FormState>();

  String? name;
  void setName(String value) {
    setState(() => name = value);
  }

  String? age;
  void setAge(String value) {
    setState(() => age = value);
  }

  File? imageFile;
  void setImageFile(File value) {
    setState(() => imageFile = value);
  }

  void _submitForm() {
    if (age != null && formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => RegisteredUserScreen(
                hasAnimal: widget.hasAnimal,
                name: name!,
                imageFile: imageFile,
              )));
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: CustomColor.brown1,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            const Center(
              child: Text(
                '내 정보 입력',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.22,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const ArrowSVG(strokeColor: CustomColor.black2)),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
          ),
          UserPhotoWidget(setImageFile: setImageFile),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          UserFormWidget(
            setName: setName,
            setAge: setAge,
            formKey: formKey,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.175,
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
              onPressed: _submitForm,
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
