import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_form_widget.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_photo_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class RegisterUserScreen extends StatefulWidget {
  const RegisterUserScreen({super.key});

  @override
  State<RegisterUserScreen> createState() => _RegisterUserScreenState();
}

class _RegisterUserScreenState extends State<RegisterUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.brown1,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.207),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.67 + 65,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            UserPhotoWidget(),
                            SizedBox(height: 80),
                            UserFormWidget(),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: MediaQuery.of(context).size.height * 0.1),
                          child: Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(288, 49),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: CustomColor.black2,
                              ),
                              onPressed: () =>
                                  Get.find<UserController>().submitForm(),
                              child: const Text(
                                '다음',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.08,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () => Get.back(),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: const SizedBox(
                          width: 34,
                          height: 34,
                          child: Padding(
                            padding: EdgeInsets.all(7),
                            child: ArrowSVG(strokeColor: CustomColor.black2),
                          ),
                        )),
                    const SizedBox(width: 50),
                    const Text(
                      '내 정보 입력',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 84),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
