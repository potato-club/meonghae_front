import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/screens/post_write_screen.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/post_screen/post_list_item_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 18),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: const PostMenuBarWidget(),
            ),
            Expanded(
              child: Stack(children: [
                GetX<PostController>(builder: (controller) {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(CustomColor.brown1),
                        strokeWidth: 5,
                      ),
                    );
                  } else {
                    return ListView.builder(
                        controller: controller.scrollController.value,
                        itemCount: controller.posts.length,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            PostListItemWidget(
                                postData: controller.posts[index]),
                            if (controller.hasMore.value &&
                                controller.posts.length == index + 1)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 40),
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      CustomColor.brown1),
                                  strokeWidth: 5,
                                ),
                              )
                            else if (!controller.hasMore.value &&
                                controller.posts.length == index + 1)
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 40),
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      CustomColor.brown1),
                                  strokeWidth: 5,
                                ),
                              ),
                          ]);
                        });
                  }
                }),
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
