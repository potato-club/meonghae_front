import 'package:flutter/material.dart';
import 'registerForm_widget.dart';
import 'registerImage_widget.dart';

class RegisterInitForm extends StatelessWidget {
  final int index;
  const RegisterInitForm({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RegisterImage(index: index),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.13),
          child: RegisterForm(index: index),
        ),
      ],
    );
  }
}
