import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/models/post_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PostController extends GetxController {
  var scrollController = ScrollController().obs;
  RefreshController refreshController =
      RefreshController(initialRefresh: false);
  var titleTextController = TextEditingController();
  var contentTextController = TextEditingController();
  var images = <File>[].obs;
  var posts = <PostModel>[].obs;
  var type = 1.obs;
  var isLoading = true.obs;
  var hasMore = false.obs;
  var page = 1.obs;
  var writeType = 0.obs;
  var isWriting = false.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.value.addListener(() {
      if (scrollController.value.position.pixels ==
              scrollController.value.position.maxScrollExtent &&
          hasMore.value) {
        fetchData(type.value);
      }
    });
    fetchData(type.value);
  }

  void setType(int value) {
    if (type.value != value) {
      posts.clear();
      isLoading.value = true;
      type.value = value;
      page.value = 1;
      fetchData(type.value);
    }
  }

  void setWriteType(int value) {
    writeType.value = value;
  }

  void editImages() {
    if (writeType.value != 3) {
      if (images.length > 3) {
        images.value = images.sublist(0, 3);
        SnackBarWidget.show(
            SnackBarType.error, '실종신고 외의 게시글에서는 최대 3장의 사진만 등록 가능해요');
      }
    }
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

  void reload() {
    isLoading.value = true;
    posts.value = [];
    page.value = 1;
    fetchData(type.value);
    refreshController.refreshCompleted();
  }

  void clear() {
    writeType.value = 0;
    titleTextController.clear();
    contentTextController.clear();
    images.value = [];
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
      errorMsg: "게시글 리스트 호출에 실패하였어요",
    );
    isLoading.value = false;
    if (hasMore.value) page++;
  }

  void writePost() async {
    if (!isWriting.value) {
      print(
          '${images.isNotEmpty} / ${titleTextController.text} / ${contentTextController.text}');
      print('시작');
      if (titleTextController.text != '' && contentTextController.text != '') {
        isWriting.value = true;
        dio.FormData formData = dio.FormData.fromMap({
          "title": titleTextController.text,
          "content": contentTextController.text,
          if (images.isNotEmpty)
            "images": [
              for (File image in images)
                await dio.MultipartFile.fromFile(image.path)
            ]
        });
        print('폼데이터 만들기');
        await SendAPI.post(
          url: "/community-service/boards/${writeType.value}",
          request: formData,
          successCode: 201,
          successFunc: (data) {
            Get.back();
            clear();
            reload();
            SnackBarWidget.show(SnackBarType.check, '성공적으로 게시글을 작성하였어요');
          },
          errorMsg: "게시글 작성에 실패하였어요",
        );
        isWriting.value = false;
      } else {
        SnackBarWidget.show(SnackBarType.error, "모든 정보를 입력해주세요");
      }
      print('끝');
    }
  }

  Future<bool> willPop() async {
    CustomWarningModalWidget.show(
        '페이지를 나가시겠어요?', '지금까지 작성했던 내용들은\n지워지게 되므로 유의해주세요', () {
      Get.back();
      clear();
    });
    return true;
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
