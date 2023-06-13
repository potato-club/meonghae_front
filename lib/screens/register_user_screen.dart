import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/config/base_url.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/screens/registered_user_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_form_widget.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_photo_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class RegisterUserScreen extends StatefulWidget {
  final bool hasAnimal;
  final String email;
  const RegisterUserScreen(
      {super.key, required this.hasAnimal, required this.email});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  final formKey = GlobalKey<FormState>();

  String? name;
  void setName(String value) {
    setState(() => name = value);
  }

  String? birth;
  void setBirth(String value) {
    setState(() => birth = value);
  }

  String? age;
  void setAge(String value) {
    setState(() => age = value);
  }

  File? imageFile;
  void setImageFile(File value) {
    setState(() => imageFile = value);
  }

  Future<void> _submitForm() async {
    if (age != null && formKey.currentState!.validate()) {
      formKey.currentState!.save();
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => RegisteredUserScreen(
                hasAnimal: widget.hasAnimal,
                userInfo: {
                  'nickname': name,
                  'birth': birth!.replaceAll('.', ''),
                  'age': int.parse(age!),
                  'email': widget.email
                }!,
                imageFile: imageFile,
              )));
    } else {
      SnackBarWidget.show(context, SnackBarType.alarm, '모두 입력해주세요');
    }
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
            const SizedBox(
              height: 21,
              child: Center(
                child: Text(
                  '내 정보 입력',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width * 0.21,
              child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: ArrowSVG(strokeColor: CustomColor.black2),
                  )),
            ),
          ]),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.06,
          ),
          UserPhotoWidget(setImageFile: setImageFile),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.14,
          ),
          UserFormWidget(
            setName: setName,
            setAge: setAge,
            setBirth: setBirth,
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
