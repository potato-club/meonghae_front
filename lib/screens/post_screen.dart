import 'package:flutter/material.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_screen/post_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_view_widget.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String sectionName = 'boast';
  void setSectionName(String value) {
    setState(() {
      sectionName = value;
      print(sectionName);
    });
  }

// sectionName : boast / fun / missing
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                PostMenuBarWidget(
                  currentSection: sectionName,
                  setSectionName: setSectionName,
                ),
                const SizedBox(height: 14),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: PostViewWidget(currentSection: sectionName)),
                )
              ],
            ),
          ),
          const Positioned(
            bottom: 0,
            child: UnderBarWidget(currentScreen: 'post'),
          ),
        ]),
      ),
    );
  }
}
