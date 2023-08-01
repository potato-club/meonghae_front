import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/post_model.dart';

class PostController extends GetxController {
  var scrollController = ScrollController().obs;
  var posts = <PostModel>[].obs;
  var type = 1.obs;
  var isLoading = true.obs;
  var hasMore = false.obs;
  var page = 1.obs;

  void setType(int value) {
    if (type.value != value) {
      posts.clear();
      isLoading.value = true;
      type.value = value;
      page.value = 1;
      fetchData(type.value);
    }
  }

  @override
  void onInit() {
    fetchData(type.value);
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        fetchData(type.value);
      }
    });
    super.onInit();
  }

  void fetchData(int type) async {
    await SendAPI.get(
      url: "/community-service/boards",
      params: {'type': type, 'p': page.value},
      successFunc: (data) {
        List<Map<String, dynamic>> contentList =
            List<Map<String, dynamic>>.from(data.data['content']);
        hasMore.value = contentList.length == 20;
        final List<PostModel> postList =
            contentList.map((json) => PostModel.fromJson(json)).toList();
        posts.addAll(postList);
      },
      errorMsg: "게시글 리스트 호출에 실패하였습니다",
    );
    isLoading.value = false;
    if (hasMore.value) page++;
  }

  String typeToString() {
    switch (type.value) {
      case 1:
        return '멍자랑';
      case 2:
        return '웃긴멍';
      case 3:
        return '실종신고';
      default:
        return '';
    }
  }
}
