import 'package:flutter/material.dart';
import 'registerForm_widget.dart';
import 'registerImage_widget.dart';

class RegisterInitForm extends StatelessWidget {
  const RegisterInitForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RegisterImage(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.06),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.13),
          child: const RegisterForm(),
        ),
      ],
    );
  }
}
