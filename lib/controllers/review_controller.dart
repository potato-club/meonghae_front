import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/review_model.dart';

class ReviewController extends GetxController {
  var scrollController = ScrollController().obs;
  var reviews = <ReviewModel>[].obs;
  var isLoading = true.obs;
  var hasMore = false.obs;
  var page = 1.obs;
  var type = 1.obs;
  var isPhoto = false.obs;
  var sort = 'LATEST'.obs;
  var keyword = ''.obs;

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

  void setType(int value) {
    reviews.clear();
    isLoading.value = true;
    isPhoto.value = false;
    sort.value = 'LATEST';
    keyword.value = '';
    type.value = value;
    page.value = 1;
    fetchData();
  }

  void setIsPhoto() {
    reviews.clear();
    isLoading.value = true;
    isPhoto.value = !isPhoto.value;
    page.value = 1;
    fetchData();
  }

  void setSort(String value) {
    reviews.clear();
    isLoading.value = true;
    sort.value = value;
    page.value = 1;
    fetchData();
  }

  void setKeyWord(String value) {
    reviews.clear();
    isLoading.value = true;
    keyword.value = value;
    page.value = 1;
    fetchData();
  }

  void reload() {
    reviews.clear();
    isLoading.value = true;
    page.value = 1;
    fetchData();
  }

  void fetchData() async {
    await SendAPI.get(
      url: "/community-service/reviews/${type.value}",
      params: {
        'p': page.value,
        "sort": sort.value,
        if (keyword.value != '') "keyword": keyword.value,
        "photo": isPhoto.value,
      },
      successFunc: (data) {
        List<Map<String, dynamic>> contentList =
            List<Map<String, dynamic>>.from(data.data['content']);
        hasMore.value = contentList.length == 6;
        final List<ReviewModel> postList =
            contentList.map((json) => ReviewModel.fromJson(json)).toList();
        reviews.addAll(postList);
      },
      errorMsg: "리뷰정보 호출에 실패하였습니다",
    );
    isLoading.value = false;
    if (hasMore.value) page++;
  }

  String typeToString(int type) {
    switch (type) {
      case 1:
        return '넥카라';
      case 2:
        return '목줄';
      case 3:
        return '장난감';
      case 4:
        return '방석';
      case 5:
        return '목욕용품';
      case 6:
        return '사료';
      case 7:
        return '강아지껌';
      case 8:
        return '입마개';
      case 9:
        return '유모차';
      case 10:
        return '배변패드';
      case 11:
        return '간식';
      case 12:
        return '바디용품';
      default:
        return '';
    }
  }
}
