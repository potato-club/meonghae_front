import 'package:flutter/material.dart';

import 'registerForm_widget.dart';
import 'registerImage_widget.dart';

class RegisterInitForm extends StatelessWidget {
  final Function onAddRegisterInitForm;
  const RegisterInitForm({
    super.key,
    required this.onAddRegisterInitForm,
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
              color: const Color(0xFFF2CB80),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(
                      MediaQuery.of(context).size.width * 0.5, 74),
                  topRight: Radius.elliptical(
                      MediaQuery.of(context).size.width * 0.5, 74)),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              child: RegisterForm(
                onAddRegisterInitForm: onAddRegisterInitForm,
              ),
            ),
          ),
        ),
        const Positioned(left: 0, right: 0, top: 40, child: RegisterImage()),
      ],
    );
  }
}
