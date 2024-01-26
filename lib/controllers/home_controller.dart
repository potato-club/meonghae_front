import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/post_preview_model.dart';
import 'package:meonghae_front/models/schedule_preview_model.dart';

class HomeController extends GetxController {
  var currentPage = 2.obs;
  PageController pageController = PageController(initialPage: 2);

  var schedulePreview = <SchedulePreviewModel>[].obs;
  var isScheduleLoading = false.obs;
  var postPreviewShow = PostPreviewModel().obs;
  var postPreviewFun = PostPreviewModel().obs;
  var postPreviewMissing = PostPreviewModel().obs;
  var isPostLoading = false.obs;

  Future<void> getSchedulePreview() async {
    isScheduleLoading.value = true;
    await SendAPI.get(
        url: "/profile-service/profile/calendar/preview",
        successFunc: (data) {
          List<Map<String, dynamic>> contentList =
              List<Map<String, dynamic>>.from(data.data);
          final List<SchedulePreviewModel> eventsList = contentList
              .map((json) => SchedulePreviewModel.fromJson(json))
              .toList();
          schedulePreview.value = eventsList;
        },
        errorMsg: "일정 미리보기 정보 호출에 실패하였어요");
    isScheduleLoading.value = false;
  }

  Future<void> getPostPreview() async {
    isPostLoading.value = true;
    await SendAPI.get(
      url: "/community-service/boards/main",
      successFunc: (data) {
        List<Map<String, dynamic>> contentList =
            List<Map<String, dynamic>>.from(data.data);
        final List<PostPreviewModel> eventsList =
            contentList.map((json) => PostPreviewModel.fromJson(json)).toList();
        for (int i = 0; i < eventsList.length; i++) {
          if (eventsList[i].type == "SHOW") {
            postPreviewShow.value = eventsList[i];
          } else if (eventsList[i].type == "FUN") {
            postPreviewFun.value = eventsList[i];
          } else {
            postPreviewMissing.value = eventsList[i];
          }
        }
      },
      errorMsg: "게시글 미리보기 정보 호출에 실패하였어요",
    );
    isPostLoading.value = false;
  }

  void navigateToPage(int index) {
    currentPage.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 400), curve: Curves.ease);
  }
}
