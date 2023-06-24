import 'package:flutter/material.dart';
import 'package:meonghae_front/models/infoModel.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'registerForm_widget.dart';
import 'registerImage_widget.dart';

class RegisterInitForm extends StatelessWidget {
  final InfoModel formData;
  final num index;
  final Function setData;
  const RegisterInitForm({
    super.key,
    required this.index,
    required this.setData,
    required this.formData,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.only(top: 100),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.65,
            decoration: BoxDecoration(
              color: CustomColor.brown1,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(
                      MediaQuery.of(context).size.width * 0.5, 74),
                  topRight: Radius.elliptical(
                      MediaQuery.of(context).size.width * 0.5, 74)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.13),
              child: RegisterForm(
                  formData: formData, index: index, setData: setData),
            ),
          ),
        ),
        Positioned(
            left: 0,
            right: 0,
            top: 40,
            child: RegisterImage(
                index: index, imageFile: formData.file, setData: setData)),
      ],
    );
  }
}
