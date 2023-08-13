import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
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
      child: const Scaffold(
          backgroundColor: CustomColor.white,
          body: Stack(children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 100),
                  WriteFormWidget(),
                ],
              ),
            ),
            Positioned(child: BannerWidget()),
          ])),
    );
  }
}
