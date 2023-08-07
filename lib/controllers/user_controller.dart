import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/models/user_info_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class UserController extends GetxController {
  var userInfo = UserInfoModel(
    age: 0,
    birth: '',
    email: '',
    nickname: '',
    fileName: null,
    fileUrl: null,
  ).obs;
  var prevUserInfo = UserInfoModel(
    age: 0,
    birth: '',
    email: '',
    nickname: '',
    fileName: null,
    fileUrl: null,
  ).obs;
  var nameTextController = TextEditingController();
  var birthTextController = TextEditingController();
  var ageTextController = TextEditingController();
  Rx<File?> file = Rx<File?>(null);
  var isEdit = false.obs;
  var registerEmail = ''.obs;
  Rx<String?> registerAge = Rx<String?>(null);
  var hasAnimal = false.obs;

  void setRegisterEmail(String email) {
    registerEmail.value = email;
  }

  void setIsEdit(bool state) {
    isEdit.value = state;
    file.value = null;
  }

  void setHasAnimal(bool state) {
    hasAnimal.value = state;
  }

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      file.value = File(pickedFile.path);
    }
  }

  void clearTextControllers() {
    nameTextController.clear();
    birthTextController.clear();
    ageTextController.clear();
  }

  void initTextControllers() {
    nameTextController.text = userInfo.value.nickname;
    birthTextController.text = userInfo.value.birth;
    ageTextController.text = userInfo.value.age.toString();
  }

  void savePrevUserInfo() async {
    prevUserInfo.value = UserInfoModel(
      age: int.parse(registerAge.value!),
      birth: birthTextController.text,
      email: registerEmail.value,
      nickname: nameTextController.text,
      fileUrl: file.value?.path,
    );
  }

  Future<void> editUserInfo() async {
    if (nameTextController.text != userInfo.value.nickname ||
        birthTextController.text != userInfo.value.birth ||
        int.parse(ageTextController.text) != userInfo.value.age ||
        file.value != null) {
      if (nameTextController.text != '' &&
          birthTextController.text.length == 10 &&
          ageTextController.text != '') {
        savePrevUserInfo();
        dio.FormData formData = dio.FormData.fromMap({
          "nickname": nameTextController.text,
          "birth": birthTextController.text.replaceAll('.', ''),
          "age": int.parse(ageTextController.text),
          if (file.value != null)
            "file": await dio.MultipartFile.fromFile(file.value!.path)
        });
        SendAPI.put(
            url: "/user-service/mypage",
            request: formData,
            successFunc: (data) {
              SendAPI.get(
                url: '/user-service/mypage',
                successFunc: (subData) {
                  userInfo.value = UserInfoModel.fromJson(data.data);
                  SnackBarWidget.show(SnackBarType.check, '내 정보가 성공적으로 변경되었어요');
                },
                errorMsg: "유저정보 호출에 실패하였습니다",
              );
              isEdit.value = false;
            },
            errorMsg: "유저 정보 변경에 실패하였습니다");
      } else {
        SnackBarWidget.show(SnackBarType.error, '모든 정보를 입력해주세요');
      }
    } else {
      isEdit.value = false;
    }
  }

  void fetchData() async {
    await SendAPI.get(
      url: '/user-service/mypage',
      successFunc: (data) {
        userInfo.value = UserInfoModel.fromJson(data.data);
        prevUserInfo.value = UserInfoModel.fromJson(data.data);
      },
      errorMsg: "유저정보 호출에 실패하였습니다",
    );
  }

  void signUp() async {
    dio.FormData formData = dio.FormData.fromMap({
      "age": prevUserInfo.value.age,
      "birth": prevUserInfo.value.birth.replaceAll('.', ''),
      "email": prevUserInfo.value.email,
      "nickname": prevUserInfo.value.nickname,
      if (prevUserInfo.value.fileUrl != null)
        "file": await dio.MultipartFile.fromFile(prevUserInfo.value.fileUrl!)
    });
    SendAPI.post(
      url: "/user-service/signup",
      request: formData,
      successFunc: (data) {
        saveAccessToken(data.headers['authorization']![0]);
        saveRefreshToken(data.headers['refreshtoken']![0]);
        userInfo.value = UserInfoModel(
          age: prevUserInfo.value.age,
          birth: prevUserInfo.value.birth,
          email: prevUserInfo.value.email,
          nickname: prevUserInfo.value.nickname,
          fileUrl: prevUserInfo.value.fileUrl,
        );
        SnackBarWidget.show(SnackBarType.check, '회원가입에 성공했습니다');
        file.value = null;
        hasAnimal.value
            ? Get.offAllNamed(AppRoutes.registerDog)
            : Get.offAllNamed(AppRoutes.introVideo);
      },
      errorMsg: '유저정보 등록에 실패하였습니다',
    );
  }
}
