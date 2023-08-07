import 'package:flutter/material.dart';
import 'package:meonghae_front/models/info_model.dart';
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
    return Column(
      children: [
        RegisterImage(index: index, imageFile: formData.file, setData: setData),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.13),
          child:
              RegisterForm(formData: formData, index: index, setData: setData),
        ),
      ],
    );
  }
}
