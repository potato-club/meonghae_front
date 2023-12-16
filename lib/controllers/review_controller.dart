import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/review_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ReviewController extends GetxController {
  var scrollController = ScrollController().obs;
  var titleTextController = TextEditingController();
  var contentTextController = TextEditingController();
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var reviews = <ReviewModel>[].obs;
  var isLoading = true.obs;
  var hasMore = false.obs;
  var page = 1.obs;
  var type = 1.obs;
  var isPhoto = false.obs;
  var sort = 'LATEST'.obs;
  var keyword = ''.obs;
  var writeType = 0.obs;
  var images = <File>[].obs;
  var rate = 0.0.obs;
  var isWriting = false.obs;
  var editId = 0.obs;

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

  void setWriteType(int value) {
    writeType.value = value;
  }

  void setRate(double value) {
    rate.value = value;
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

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      images.add(File(pickedFile.path));
    }
  }

  void deleteImage(int index) {
    List<File> editImages = images;
    editImages.removeAt(index);
    images.value = editImages;
  }

  Future<void> onClickLike(int index, int id, bool isLike) async {
    if (reviews[index].recommendStatus == 'NONE') {
      reviews[index] = ReviewModel(
        id: id,
        title: reviews[index].title,
        content: reviews[index].content,
        date: reviews[index].date,
        likes: isLike ? reviews[index].likes + 1 : reviews[index].likes,
        dislikes:
            isLike ? reviews[index].dislikes : reviews[index].dislikes + 1,
        nickname: reviews[index].nickname,
        rating: reviews[index].rating,
        images: reviews[index].images,
        profileUrl: reviews[index].profileUrl,
        recommendStatus: isLike ? 'TRUE' : 'FALSE',
        writer: reviews[index].writer,
      );
    } else if (reviews[index].recommendStatus == 'TRUE') {
      reviews[index] = ReviewModel(
        id: id,
        title: reviews[index].title,
        content: reviews[index].content,
        date: reviews[index].date,
        likes: reviews[index].likes - 1,
        dislikes:
            isLike ? reviews[index].dislikes : reviews[index].dislikes + 1,
        nickname: reviews[index].nickname,
        rating: reviews[index].rating,
        images: reviews[index].images,
        profileUrl: reviews[index].profileUrl,
        recommendStatus: isLike ? 'NONE' : 'FALSE',
        writer: reviews[index].writer,
      );
    } else {
      reviews[index] = ReviewModel(
        id: id,
        title: reviews[index].title,
        content: reviews[index].content,
        date: reviews[index].date,
        likes: isLike ? reviews[index].likes + 1 : reviews[index].likes,
        dislikes: reviews[index].dislikes - 1,
        nickname: reviews[index].nickname,
        rating: reviews[index].rating,
        images: reviews[index].images,
        profileUrl: reviews[index].profileUrl,
        recommendStatus: isLike ? 'TRUE' : 'NONE',
        writer: reviews[index].writer,
      );
    }
    await SendAPI.post(
      url: "/community-service/reviews/$id/recommend",
      request: {"isLike": isLike},
      successFunc: (data) {},
      errorMsg: "${isLike ? "좋아요" : "싫어요"} 등록에 실패하였어요",
    );
  }

  void clear() {
    writeType.value = 0;
    titleTextController.clear();
    contentTextController.clear();
    rate.value = 0.0;
    images.value = [];
  }

  void reload() {
    isLoading.value = true;
    reviews.value = [];
    page.value = 1;
    fetchData();
    refreshController.refreshCompleted();
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
        print(data.data);
      },
      errorMsg: "리뷰정보 호출에 실패하였어요",
    );
    isLoading.value = false;
    if (hasMore.value) page++;
  }

  void writeReview() async {
    if (!isWriting.value) {
      if (titleTextController.text != '' &&
          contentTextController.text != '' &&
          rate.value != 0) {
        isWriting.value = true;
        dio.FormData formData = dio.FormData.fromMap({
          "title": titleTextController.text,
          "content": contentTextController.text,
          "rating": rate.toInt(),
          "type": writeType.value,
          if (images.isNotEmpty)
            "images": [
              for (File image in images)
                await dio.MultipartFile.fromFile(image.path)
            ]
        });
        await SendAPI.post(
          url: "/community-service/reviews",
          request: formData,
          successCode: 201,
          successFunc: (data) {
            Get.back();
            reload();
            clear();
            SnackBarWidget.show(SnackBarType.check, '성공적으로 리뷰를 작성하였어요');
          },
          errorMsg: '리뷰 작성에 실패하였어요',
        );
        isWriting.value = false;
      } else {
        SnackBarWidget.show(SnackBarType.error, "모든 정보를 입력해주세요");
      }
    }
  }

  void setEditId(int id) {
    editId.value = id;
  }

  void deleteReview() async {
    isLoading.value = true;
    await SendAPI.delete(
      url: "/community-service/reviews/${editId.value}",
      successFunc: (data) {
        reload();
      },
      errorMsg: "리뷰 삭제에 실패하였어요",
    );
    isLoading.value = false;
  }

  Future<bool> willPop() async {
    CustomWarningModalWidget.show(
        '페이지를 나가시겠어요?', '지금까지 작성했던 내용들은\n지워지게 되므로 유의해주세요', () {
      Get.back();
      clear();
    });
    return true;
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
