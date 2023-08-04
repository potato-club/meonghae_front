import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/post_comment_reply_model.dart';

class PostCommentReplyController extends GetxController {
  var scrollController = ScrollController().obs;
  var comments = <PostCommentReplyModel>[].obs;
  var id = 1.obs;
  var isLoading = true.obs;
  var hasMore = false.obs;
  var page = 1.obs;

  @override
  void onInit() {
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        fetchData();
      }
    });
    super.onInit();
  }

  void setId(int value) {
    if (id.value != value) {
      comments.clear();
      isLoading.value = true;
      id.value = value;
      page.value = 1;
      fetchData();
    }
  }

  void reload() {
    comments.clear();
    isLoading.value = true;
    page.value = 1;
    fetchData();
  }

  void fetchData() async {
    await SendAPI.get(
      url: "/community-service/boardComments/${id.value}/reply",
      successFunc: (data) {
        List<Map<String, dynamic>> contentList =
            List<Map<String, dynamic>>.from(data.data['content']);
        hasMore.value = contentList.length == 20;
        final List<PostCommentReplyModel> postList = contentList
            .map((json) => PostCommentReplyModel.fromJson(json))
            .toList();
        comments.addAll(postList);
      },
      errorMsg: "대댓글 정보 호출에 실패하였습니다",
    );
    isLoading.value = false;
    if (hasMore.value) page++;
  }
}
