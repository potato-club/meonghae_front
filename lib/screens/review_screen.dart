import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/review_controller.dart';
import 'package:meonghae_front/themes/customColor.dart';
import 'package:meonghae_front/widgets/common/loading_spinner_widget.dart';
import 'package:meonghae_front/widgets/review_screen/filter_bar_widget.dart';
import 'package:meonghae_front/widgets/review_screen/review_list_item_widget.dart';
import 'package:meonghae_front/widgets/review_screen/search_bar_widget.dart';
import 'package:meonghae_front/widgets/svg/arrow.dart';
import 'package:meonghae_front/widgets/svg/pencil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.white,
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 62,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Row(
                children: [
                  GestureDetector(
                      onTap: () => Get.back(),
                      child: const ArrowSVG(strokeColor: CustomColor.black2)),
                  const SizedBox(width: 20),
                  GetX<ReviewController>(builder: (controller) {
                    return Text(controller.typeToString(controller.type.value),
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: CustomColor.black2));
                  })
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: const SearchBarWidget(),
          ),
          const SizedBox(height: 26),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.06),
            child: const FilterBarWidget(),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Stack(children: [
              GetX<ReviewController>(builder: (controller) {
                if (controller.isLoading.value) {
                  return const Center(
                      child: Padding(
                    padding: EdgeInsets.only(bottom: 45),
                    child: LoadingSpinnerWidget(),
                  ));
                } else {
                  if (controller.reviews.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Transform.scale(
                              scale: 2,
                              child: const PencilSVG(color: CustomColor.gray)),
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
                              Get.toNamed(AppRoutes.reviewWrite);
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
                          const SizedBox(height: 45),
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
                            itemCount: controller.reviews.length,
                            itemBuilder: (context, index) {
                              return Column(children: [
                                ReviewListItemWidget(
                                  reviewData: controller.reviews[index],
                                  index: index,
                                ),
                                if (controller.hasMore.value &&
                                    controller.reviews.length == index + 1)
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Container())
                                else if (!controller.hasMore.value &&
                                    controller.reviews.length == index + 1)
                                  Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 20),
                                      child: Container()),
                              ]);
                            }));
                  }
                }
              }),
              Positioned(
                  bottom: 16,
                  right: 16,
                  child: InkWell(
                    onTap: () {
                      Get.find<ReviewController>().setWriteType(
                          Get.find<ReviewController>().type.value);
                      Get.toNamed(AppRoutes.reviewWrite);
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
          )
        ],
      )),
    );
  }
}
