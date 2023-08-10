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
                    if (controller.posts.value.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Transform.scale(
                                scale: 2,
                                child:
                                    const PencilSVG(color: CustomColor.gray)),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(0, 30, 0, 16),
                              child: Text(
                                '아직 게시글이 없어요',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.gray,
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: const Size(200, 49),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                backgroundColor: CustomColor.brown1,
                              ),
                              onPressed: () {
                                controller.setWriteType(controller.type.value);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PostWriteScreen()));
                              },
                              child: const Text(
                                '새 게시글 작성하기',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: CustomColor.white,
                                ),
                              ),
                            ),
                          ],
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
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Container())
                              else if (!controller.hasMore.value &&
                                  controller.posts.length == index + 1)
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20),
                                    child: Container()),
                            ]);
                          });
                    }
                  }
                }),
                Positioned(
                    bottom: 16,
                    right: 16,
                    child: InkWell(
                      onTap: () {
                        Get.find<PostController>().setWriteType(
                            Get.find<PostController>().type.value);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const PostWriteScreen()));
                      },
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
