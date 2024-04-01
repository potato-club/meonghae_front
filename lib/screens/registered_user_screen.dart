import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/register_user_screen/user_registered_photo_widget.dart';
import 'package:meonghae_front/widgets/svg/tiny_right_arrow.dart';

class RegisteredUserScreen extends StatefulWidget {
  const RegisteredUserScreen({super.key});

  @override
  State<RegisteredUserScreen> createState() => _RegisteredUserScreenState();
}

class _RegisteredUserScreenState extends State<RegisteredUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.brown1,
      body: GetX<UserController>(builder: (controller) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.67 + 65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    UserRegisteredPhotoWidget(imageFile: controller.file.value),
                    const SizedBox(height: 80),
                    Column(
                      children: [
                        const Text(
                          '안녕하세요',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${controller.nameTextController.text}님!',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2,
                          ),
                        ),
                        const SizedBox(height: 11),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '수정하기',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: CustomColor.white,
                                ),
                              ),
                              SizedBox(width: 6),
                              TinyRightArrowSVG(
                                color: CustomColor.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
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
                      onPressed: () => controller.signUp(),
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
        );
      }),
    );
  }
}
