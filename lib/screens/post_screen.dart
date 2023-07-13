import 'package:flutter/material.dart';
import 'package:meonghae_front/screens/post_write_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_screen/post_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_view_widget.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  String sectionName = 'boast';
  void setSectionName(String value) {
    setState(() => sectionName = value);
  }

// sectionName : boast / fun / missing
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 32),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: PostMenuBarWidget(
                currentSection: sectionName,
                setSectionName: setSectionName,
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              child: Stack(children: [
                PostViewWidget(currentSection: sectionName),
                Positioned(
                  top: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          CustomColor.white,
                          CustomColor.white.withOpacity(0),
                        ])),
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Positioned(
                    bottom: 16,
                    right: 16,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) =>
                              const PostWriteScreen())),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColor.brown1,
                        ),
                        width: 70,
                        height: 70,
                        child: const Padding(
                          padding: EdgeInsets.all(22),
                          child: PencilSVG(
                            color: CustomColor.white,
                          ),
                        ),
                      ),
                    ))
              ]),
            ),
            const UnderBarWidget(currentScreen: '게시물'),
          ],
        ),
      ),
    );
  }
}
