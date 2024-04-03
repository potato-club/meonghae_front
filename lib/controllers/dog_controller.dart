import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/models/dog_info_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meonghae_front/widgets/common/custom_warning_modal_widget.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class DogController extends GetxController {
  var dogsInfo = <DogInfoModel>[].obs;
  var slideIndex = 0.obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isEdit = false.obs;
  Rx<bool> isChange = false.obs;
  var deleteIdList = [].obs;
  var isLoading = false.obs;
  var dogsForm = <DogFormModel>[
    DogFormModel(
      id: null,
      meetRoute: '',
      petBirth: '',
      petGender: '',
      petName: '',
      petSpecies: '',
      image: null,
      s3ResponseDto: null,
    )
  ].obs;
  var nameControllers = <TextEditingController>[].obs;
  var birthControllers = <TextEditingController>[].obs;

  @override
  void onClose() {
    for (var controller in nameControllers) {
      controller.dispose();
    }
    for (var controller in birthControllers) {
      controller.dispose();
    }
    super.onClose();
  }

  void setIsEdit(bool state) {
    initDogsForm();
    deleteIdList.clear();
    isEdit.value = state;
  }

  void addDogForm() {
    dogsForm.add(DogFormModel(
      id: null,
      meetRoute: '',
      petBirth: '',
      petGender: '',
      petName: '',
      petSpecies: '',
      image: null,
      s3ResponseDto: null,
    ));
    nameControllers.add(TextEditingController());
    birthControllers.add(TextEditingController());
  }

  void pickImage(int index) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      dogsForm[index] = DogFormModel(
        id: dogsForm[index].id,
        meetRoute: dogsForm[index].meetRoute,
        petBirth: dogsForm[index].petBirth,
        petGender: dogsForm[index].petGender,
        petName: dogsForm[index].petName,
        petSpecies: dogsForm[index].petSpecies,
        image: File(pickedFile.path),
        s3ResponseDto: dogsForm[index].s3ResponseDto,
      );
    }
  }

  void initDogsForm() {
    dogsForm.value = dogsInfo
        .map((i) => DogFormModel(
              id: i.id,
              meetRoute: i.meetRoute,
              petBirth: i.petBirth,
              petGender: i.petGender,
              petName: i.petName,
              petSpecies: i.petSpecies,
              image: null,
              s3ResponseDto: i.s3ResponseDto,
            ))
        .toList();
    nameControllers.clear();
    birthControllers.clear();
    for (var element in dogsInfo) {
      nameControllers.add(TextEditingController(text: element.petName));
      birthControllers.add(TextEditingController(text: element.petBirth));
    }
  }

  void fetchData() async {
    await SendAPI.get(
        url: "/profile-service/profile/all",
        successFunc: (data) {
          List<Map<String, dynamic>> contentList =
              List<Map<String, dynamic>>.from(data.data);
          final List<DogInfoModel> dogsInfoList =
              contentList.map((json) => DogInfoModel.fromJson(json)).toList();
          dogsInfo.value = dogsInfoList;
        },
        errorMsg: "애완동물정보 호출에 실패하였어요");
  }

  void submitForm() async {
    List<Map<String, dynamic>> result =
        dogsForm.map((i) => validator(i)).toList();
    List<dynamic> validatorList = result.map((i) => i['validator']).toList();
    bool isValidator = !validatorList.contains(false);
    if (isValidator) {
      for (var dogInfo in dogsForm) {
        dio.FormData formData = dio.FormData.fromMap({
          "meetRoute": dogInfo.meetRoute,
          "petBirth": dogInfo.petBirth.replaceAll('.', '-'),
          "petGender": dogInfo.petGender == '남' ? 'BOY' : 'GIRL',
          "petName": dogInfo.petName,
          "petSpecies": dogInfo.petSpecies,
          if (dogInfo.image != null)
            "image": await dio.MultipartFile.fromFile(dogInfo.image!.path)
        });
        await SendAPI.post(
            url: "/profile-service/profile",
            request: formData,
            isFormData: true,
            successFunc: (data) {
              slideIndex.value = 0;
              Get.offNamed(AppRoutes.introVideo);
              SnackBarWidget.show(SnackBarType.check, "성공적으로 애완동물정보가 등록되었어요");
            },
            errorMsg: "애완동물정보 등록에 실패하였어요");
      }
    } else {
      int index = validatorList.indexOf(false);
      isError.value = true;
      slideIndex.value = index;
      SnackBarWidget.show(SnackBarType.error, result[index]['error']);
    }
  }

  Map<String, dynamic> validator(DogInfoModel data) {
    if (data.petBirth != '' &&
        data.petGender != '' &&
        data.petSpecies != '' &&
        data.petName != '' &&
        data.meetRoute != '') {
      if (data.petBirth.length != 10) {
        return {'validator': false, 'error': '출생일은 숫자 8자만 입력해주세요'};
      } else {
        return {'validator': true};
      }
    } else if (data.petName == '') {
      return {'validator': false, 'error': '애완동물의 이름을 입력해주세요'};
    } else if (data.petGender == '') {
      return {'validator': false, 'error': '애완동물의 성별을 선택해주세요'};
    } else if (data.petBirth == '') {
      return {'validator': false, 'error': '애완동물의 출생일을 입력해주세요'};
    } else if (data.petSpecies == '') {
      return {'validator': false, 'error': '애완동물의 견종/묘종을 선택해주세요'};
    } else {
      return {'validator': false, 'error': '애완동물의 만남의 경로를 입력해주세요'};
    }
  }

  void editForm() async {
    if (!isLoading.value) {
      List<Map<String, dynamic>> result =
          dogsForm.map((i) => validator(i)).toList();
      List<dynamic> validatorList = result.map((i) => i['validator']).toList();
      bool isValidator = !validatorList.contains(false);
      if (isValidator) {
        isLoading.value = true;
        if (deleteIdList.isNotEmpty) {
          for (var deleteId in deleteIdList) {
            deleteForm(deleteId);
          }
          isChange.value = true;
          deleteIdList.value = [];
        }
        if (dogsForm.isNotEmpty) {
          for (int i = 0; i < dogsForm.length; i++) {
            dio.FormData formData = dio.FormData.fromMap({
              "meetRoute": dogsForm[i].meetRoute,
              "petBirth": birthControllers[i].text.replaceAll('.', '-'),
              "petGender": dogsForm[i].petGender,
              "petName": nameControllers[i].text,
              "petSpecies": dogsForm[i].petSpecies,
              if (dogsForm[i].image != null)
                "image":
                    await dio.MultipartFile.fromFile(dogsForm[i].image!.path)
            });
            if (dogsForm[i].id == null) {
              await SendAPI.post(
                  url: "/profile-service/profile",
                  request: formData,
                  isFormData: true,
                  successFunc: (data) {
                    if (i >= dogsForm.length - 1) {
                      isChange.value = true;
                    }
                  },
                  errorMsg: "애완동물정보 수정에 실패하였어요");
            } else {
              DogInfoModel? sameDogInfo;
              for (var item in dogsInfo) {
                if (item.id == dogsForm[i].id) {
                  sameDogInfo = item;
                }
              }
              if (sameDogInfo != null &&
                  !DogInfoModel.isSame(sameDogInfo, dogsForm[i])) {
                await SendAPI.put(
                    url: "/profile-service/profile/${dogsForm[i].id}",
                    request: formData,
                    isFormData: true,
                    successFunc: (data) {
                      if (i >= dogsForm.length - 1) {
                        isChange.value = true;
                      }
                    },
                    errorMsg: "애완동물정보 수정에 실패했어요");
              }
            }
          }
        }
        if (isChange.value) {
          SnackBarWidget.show(SnackBarType.check, '애완동물정보가 성공적으로 변경되었어요');
          fetchData();
          isChange.value = false;
        }
        slideIndex.value = 0;
        isLoading.value = false;
        setIsEdit(false);
      } else {
        int index = validatorList.indexOf(false);
        isError.value = true;
        slideIndex.value = index;
        SnackBarWidget.show(SnackBarType.error, result[index]['error']);
      }
    }
  }

  void addDeleteIdList() async {
    if (dogsForm[slideIndex.value].id == null) {
      nameControllers.removeAt(slideIndex.value);
      birthControllers.removeAt(slideIndex.value);
      dogsForm.removeAt(slideIndex.value);
      slideIndex.value = slideIndex.value == dogsForm.length
          ? slideIndex.value - 1
          : slideIndex.value;
    } else {
      deleteIdList.add(dogsForm[slideIndex.value].id);
      nameControllers.removeAt(slideIndex.value);
      birthControllers.removeAt(slideIndex.value);
      dogsForm.removeAt(slideIndex.value);
      slideIndex.value = slideIndex.value == dogsForm.length
          ? slideIndex.value - 1
          : slideIndex.value;
    }
  }

  void deleteForm(int id) async {
    SendAPI.delete(
        url: "/profile-service/profile/$id",
        successFunc: (data) {
          fetchData();
        },
        errorMsg: '애완동물정보 삭제에 실패하였어요');
  }

  Future<bool> willPop() async {
    if (isEdit.value) {
      CustomWarningModalWidget.show(
          '페이지를 나가시겠어요?', '지금까지 작성했던 내용들은\n지워지게 되므로 유의해주세요', () {
        Get.back();
        slideIndex.value = 0;
        setIsEdit(false);
      });
      return true;
    } else {
      Get.back();
      slideIndex.value = 0;
      setIsEdit(false);
      return true;
    }
  }
}
