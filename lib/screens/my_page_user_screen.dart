import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/user_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/edit_user_info_widget.dart';
import 'package:meonghae_front/widgets/my_page_user_screen/show_user_info_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';

class MyPageUserScreen extends StatefulWidget {
  const MyPageUserScreen({super.key});

  @override
  State<MyPageUserScreen> createState() => _MyPageUserScreenState();
}

class _MyPageUserScreenState extends State<MyPageUserScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<UserController>().setIsEdit(false);
        return true;
      },
      child: Scaffold(
        backgroundColor: CustomColor.ivory2,
        body: SafeArea(
          child: GetX<UserController>(builder: (controller) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                              controller.setIsEdit(false);
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.06,
                                vertical: 20,
                              ),
                              child: const SizedBox(
                                  width: 24,
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: ArrowSVG(
                                          strokeColor: CustomColor.black2))),
                            ),
                          ),
                          const Text(
                            '내 정보 수정',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: CustomColor.black2),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.06,
                              vertical: 20,
                            ),
                            child: const SizedBox(width: 24),
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.071),
                      controller.isEdit.value
                          ? const EditUserInfoWidget()
                          : const ShowUserInfoWidget(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.064),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(288, 49),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            backgroundColor: CustomColor.black2,
                            elevation: 0),
                        onPressed: () {
                          if (controller.isEdit.value) {
                            controller.editUserInfo();
                          } else {
                            controller.initTextControllers();
                            controller.setIsEdit(true);
                          }
                        },
                        child: Text(
                          controller.isEdit.value ? '저장하기' : '수정하기',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.isLoading.value)
                  const Positioned(
                      child: Center(
                          child: LoadingDotWidget(color: CustomColor.brown1)))
              ],
            );
          }),
        ),
      ),
    );
  }
}
