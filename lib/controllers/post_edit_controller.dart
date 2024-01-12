import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/controllers/post_controller.dart';
import 'package:meonghae_front/controllers/post_detail_controller.dart';
import 'package:meonghae_front/models/post_detail_model.dart';
import 'package:meonghae_front/widgets/common/custom_modal_widget.dart';
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';
import 'package:path_provider/path_provider.dart';

class PostEditController extends GetxController {
  var titleTextController = TextEditingController();
  var contentTextController = TextEditingController();
  var isEditing = false.obs;
  var editId = 0.obs;
  var commentId = 0.obs;
  var editPost = PostDetailModel(
    id: 0,
    title: '',
    content: '',
    date: '',
    profileUrl: null,
    images: [],
    commentSize: 0,
    likeStatus: false,
    likes: 0,
    writer: false,
  ).obs;
  var editImages = <File>[].obs;
  var prevEditImages = <File>[].obs;

  void setEditPost(PostDetailModel post, int id) {
    editPost.value = post;
    editId.value = id;
  }

  void setCommentId(int id) {
    commentId.value = id;
  }

  void editData() async {
    if (titleTextController.text.isNotEmpty &&
        contentTextController.text.isNotEmpty) {
      if (editPost.value.title != titleTextController.text ||
          editPost.value.content != contentTextController.text ||
          prevEditImages != editImages) {
        isEditing.value = true;
        dio.FormData formData = dio.FormData.fromMap({
          "title": titleTextController.text,
          "content": contentTextController.text,
          if (editImages.isNotEmpty)
            "images": [
              for (File image in editImages)
                await dio.MultipartFile.fromFile(image.path)
            ],
        });
        await SendAPI.put(
          url: "/community-service/boards/${editId.value}",
          request: formData,
          successFunc: (data) {
            Get.find<PostDetailController>().fetchData();
          },
          errorMsg: "게시글 수정에 실패하였어요",
        );
        isEditing.value = false;
        Get.back();
      } else {
        Get.back();
      }
    } else {
      SnackBarWidget.show(SnackBarType.error, "모든 정보를 입력해주세요");
    }
  }

  Future<void> goEditScreen() async {
    isEditing.value = true;
    editImages.clear();
    prevEditImages.clear();
    if (editPost.value.images != null) {
      for (var file in editPost.value.images!) {
        File imgFile = await downloadAndSaveImage(file['fileUrl']);
        editImages.add(imgFile);
        prevEditImages.add(imgFile);
      }
    }
    isEditing.value = false;
    Get.toNamed(AppRoutes.postEdit);
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      editImages.add(File(pickedFile.path));
    }
  }

  void deleteImage(int index) {
    editImages.removeAt(index);
  }

  Future<File> downloadAndSaveImage(String imageUrl) async {
    var response = await dio.Dio().get(imageUrl,
        options: dio.Options(responseType: dio.ResponseType.bytes));
    final directory = await getApplicationDocumentsDirectory();
    String filePath =
        '${directory.path}/${Uri.parse(imageUrl).pathSegments.last}';

    File file = File(filePath);
    await file.writeAsBytes(response.data as List<int>);
    return file;
  }

  Future<bool> willPop() async {
    CustomWarningModalWidget.show(
        '페이지를 나가시겠어요?', '지금까지 작성했던 내용들은\n지워지게 되므로 유의해주세요', () {
      Get.back();
    });
    return true;
  }

  Future<void> deleteData() async {
    CustomModalWidget.show('게시글을 삭제하시겠어요?', () async {
      isEditing.value = true;
      await SendAPI.delete(
        url: "/community-service/boards/${editId.value}",
        successFunc: (data) {
          Get.find<PostController>().reload();
          Get.back();
        },
        errorMsg: "게시글 삭제에 실패하였어요",
      );
      isEditing.value = false;
    });
  }

  Future<void> deleteComment() async {
    CustomModalWidget.show('댓글을 삭제하시겠어요?', () async {
      isEditing.value = true;
      await SendAPI.delete(
        url: "/community-service/boardComments/${commentId.value}",
        successFunc: (data) {},
        errorMsg: "댓글 삭제에 실패하였어요",
      );
      Get.find<PostDetailController>().fetchData();
      isEditing.value = false;
    });
  }
}
