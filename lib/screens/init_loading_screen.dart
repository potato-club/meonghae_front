import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/models/login_model.dart';
import 'package:meonghae_front/themes/custom_color.dart';

class InitLoadingScreen extends StatefulWidget {
  const InitLoadingScreen({super.key});

  @override
  State<InitLoadingScreen> createState() => _InitLoadingScreenState();
}

class _InitLoadingScreenState extends State<InitLoadingScreen> {
  late Timer _timer;

  @override
  void initState() {
    LoginModel.wasLogined();
    _timer = Timer(
        const Duration(seconds: 3), () => {Get.offNamed(AppRoutes.login)});
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColor.brown1,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.sizeOf(context).height * 0.08),
              child: Image(
                image: const AssetImage('assets/images/logo/meonghae_logo.png'),
                width: MediaQuery.sizeOf(context).width * 0.4,
              ),
            ),
          ),
        ));
  }
}
