import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/custom_color.dart';
import 'package:meonghae_front/widgets/common/loading_dot_widget.dart';
import 'package:meonghae_front/widgets/post_write_screen/banner_widget.dart';
import 'package:meonghae_front/widgets/post_write_screen/write_form_widget.dart';

class PostWriteScreen extends StatefulWidget {
  const PostWriteScreen({super.key});

  @override
  State<PostWriteScreen> createState() => _PostWriteScreenState();
}

class _PostWriteScreenState extends State<PostWriteScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Get.find<PostController>().willPop(),
      child: Scaffold(
          backgroundColor: CustomColor.white,
          body: GetX<PostController>(builder: (controller) {
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
              if (controller.isWriting.value)
                const Positioned(
                    child: Center(
                  child: LoadingDotWidget(color: CustomColor.brown1),
                )),
            ]);
          })),
    );
  }
}
