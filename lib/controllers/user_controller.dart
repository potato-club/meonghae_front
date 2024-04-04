import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/models/login_model.dart';
import 'package:meonghae_front/models/user_info_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
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
  Rx<String> registerAge = Rx<String>("1");
  var hasAnimal = false.obs;
  var isLoading = false.obs;

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
      age: int.parse(registerAge.value),
      birth: birthTextController.text,
      email: registerEmail.value,
      nickname: nameTextController.text,
      fileUrl: file.value?.path,
    );
  }

  Future<void> submitForm() async {
    if (nameTextController.text.isNotEmpty &&
        birthTextController.text.length == 10) {
      savePrevUserInfo();
      Get.toNamed(AppRoutes.registeredUser);
      registerAge.value = "1";
    } else {
      SnackBarWidget.show(SnackBarType.error, '모두 입력해주세요');
    }
  }

  Future<void> editUserInfo() async {
    if (!isLoading.value) {
      if (nameTextController.text != userInfo.value.nickname ||
          birthTextController.text != userInfo.value.birth ||
          int.parse(ageTextController.text) != userInfo.value.age ||
          file.value != null) {
        if (nameTextController.text.isNotEmpty &&
            birthTextController.text.length == 10 &&
            ageTextController.text.isNotEmpty) {
          isLoading.value = true;
          savePrevUserInfo();
          dio.FormData formData = dio.FormData.fromMap({
            "nickname": nameTextController.text,
            "birth": birthTextController.text.replaceAll('.', ''),
            "age": int.parse(ageTextController.text),
            if (file.value != null)
              "file": await dio.MultipartFile.fromFile(file.value!.path)
          });
          await SendAPI.put(
              url: "/user-service/mypage",
              request: formData,
              isFormData: true,
              successFunc: (data) {
                SnackBarWidget.show(SnackBarType.check, '내 정보가 성공적으로 변경되었어요');
                fetchData();
              },
              errorMsg: "내 정보 변경에 실패하였어요");
          setIsEdit(false);
          isLoading.value = false;
        } else {
          if (nameTextController.text.isEmpty) {
            SnackBarWidget.show(SnackBarType.error, "이름을 입력해주세요");
          } else if (birthTextController.text.length != 10) {
            SnackBarWidget.show(SnackBarType.error, "올바른 생일 정보를 입력해주세요");
          } else {
            SnackBarWidget.show(SnackBarType.error, "나이를 입력해주세요");
          }
        }
      } else {
        isEdit.value = false;
      }
    }
  }

  void fetchData() async {
    await SendAPI.get(
      url: '/user-service/mypage',
      successFunc: (data) {
        userInfo.value = UserInfoModel.fromJson(data.data);
        prevUserInfo.value = UserInfoModel.fromJson(data.data);
      },
      errorMsg: "내 정보 호출에 실패하였어요",
    );
  }

  void signUp() async {
    if (!isLoading.value) {
      isLoading.value = true;
      dio.FormData formData = dio.FormData.fromMap({
        "age": prevUserInfo.value.age,
        "birth": prevUserInfo.value.birth.replaceAll('.', ''),
        "email": prevUserInfo.value.email,
        "nickname": prevUserInfo.value.nickname,
        if (prevUserInfo.value.fileUrl != null)
          "file": await dio.MultipartFile.fromFile(prevUserInfo.value.fileUrl!)
      });
      await SendAPI.post(
          url: "/user-service/signup",
          request: formData,
          isFormData: true,
          successFunc: (data) {
            saveAccessToken(data.headers['authorization']![0]);
            saveRefreshToken(data.headers['refreshtoken']![0]);
            SnackBarWidget.show(SnackBarType.check, '회원가입에 성공했어요');
            file.value = null;
            hasAnimal.value
                ? Get.offAllNamed(AppRoutes.registerDog)
                : Get.offAllNamed(AppRoutes.introVideo);
            isLoading.value = false;
          },
          errorMsg: '내 정보 등록에 실패하였어요');
    }
  }

  void withdrawal() {
    CustomWarningModalWidget.show(
        '계정을 삭제하시겠어요?',
        '탈퇴 후 개인정보 등의 데이터가 삭제되며\n복구할 수 없어요',
        () => SendAPI.put(
            url: "/user-service/withdrawal",
            successFunc: (data) {
              LoginModel.logout();
              SnackBarWidget.show(SnackBarType.check, '회원탈퇴에 성공했어요');
            },
            errorMsg: "회원탈퇴에 실패하였어요"));
  }

  Future<bool> cancelWidthdrawal(String email) async {
    bool isSuccess = false;
    SendAPI.put(
        url: "/user-service/cancel",
        request: {
          'agreement': true,
          'email': email,
        },
        successFunc: (data) {
          SnackBarWidget.show(SnackBarType.check, '성공적으로 회원탈퇴가 취소되었어요');
          isSuccess = true;
        },
        errorMsg: "회원탈퇴 취소에 실패하였어요");
    return isSuccess;
  }
}
