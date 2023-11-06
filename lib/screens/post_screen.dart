import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/loading_spinner_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_list_item_widget.dart';
import 'package:meonghae_front/widgets/post_screen/post_menu_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';
import 'package:meonghae_front/widgets/under_bar/under_bar_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
                    return const LoadingSpinnerWidget();
                  } else {
                    if (controller.posts.isEmpty) {
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
                                Get.toNamed(AppRoutes.postWrite);
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
                      return SmartRefresher(
                        controller: controller.refreshController,
                        enablePullDown: true,
                        enablePullUp: false,
                        onRefresh: () async => controller.reload(),
                        header: CustomHeader(
                          builder: (BuildContext context, RefreshStatus? mode) {
                            return Container(
                              height: 120,
                              color: CustomColor.ivory2,
                              child: Stack(
                                children: [
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      height: 24,
                                      decoration: const BoxDecoration(
                                          color: CustomColor.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(24),
                                              topRight: Radius.circular(24))),
                                    ),
                                  ),
                                  const Positioned(
                                      bottom: 70,
                                      left: 0,
                                      right: 0,
                                      child: Center(
                                          child: Text(
                                        '새로고침 하개?',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColor.black3,
                                        ),
                                      ))),
                                  Positioned(
                                    bottom: 0,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Center(
                                        child: SizedBox(
                                          width: 100,
                                          child: Transform.translate(
                                            offset: const Offset(0, 7),
                                            child: Image.asset(
                                                'assets/images/dog_pictures/peek_dog.png'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                        child: ListView.builder(
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
                            }),
                      );
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
                        Get.toNamed(AppRoutes.postWrite);
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
