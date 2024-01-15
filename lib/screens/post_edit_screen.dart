import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_edit_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/post_edit_screen/write_form_widget.dart';
import '../widgets/post_edit_screen/banner_widget.dart';

class PostEditScreen extends StatelessWidget {
  const PostEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Get.find<PostEditController>().willPop(),
      child: Scaffold(
          backgroundColor: CustomColor.white,
          body: GetX<PostEditController>(builder: (controller) {
            return Stack(children: [
              const SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 100),
                    WriteFormWidget(),
                  ],
                ),
              ),
              const Positioned(child: BannerWidget()),
              if (controller.isEditing.value)
                const Positioned(
                    child: Center(
                  child: LoadingDotWidget(color: CustomColor.brown1),
                )),
            ]);
          })),
    );
  }
}
