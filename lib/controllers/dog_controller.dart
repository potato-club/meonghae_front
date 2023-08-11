import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meonghae_front/api/dio.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/models/dog_info_model.dart';
import 'package:dio/dio.dart' as dio;
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class DogController extends GetxController {
  var dogsInfo = <DogInfoModel>[].obs;
  var slideIndex = 0.obs;
  Rx<bool> isError = false.obs;
  Rx<bool> isEdit = false.obs;
  Rx<bool> isChange = false.obs;
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

  void setIsEdit(bool state) {
    initDogsForm();
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
  }

  void fetchData() async {
    await SendAPI.get(
        url: "/profile-service/profile/all",
        successFunc: (data) {
          List<Map<String, dynamic>> contentList =
              List<Map<String, dynamic>>.from(data.data);
          final List<DogInfoModel> dogsInfoList =
              contentList.map((json) => DogInfoModel.fromJson(json)).toList();
          final List<DogFormModel> dogsFormList =
              contentList.map((json) => DogFormModel.fromJson(json)).toList();
          dogsInfo.value = dogsInfoList;
          dogsForm.value = dogsFormList;
          slideIndex.value = 0;
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
          successFunc: (data) => Get.offNamed(AppRoutes.introVideo),
          errorMsg: "애완동물정보 등록에 실패하였어요",
        );
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
        data.petName != '') {
      if (data.petBirth.length != 10) {
        return {'validator': false, 'error': '출생일은 숫자 8자만 입력해주세요'};
      } else {
        return {'validator': true};
      }
    } else {
      return {'validator': false, 'error': '모든 정보를 입력해주세요'};
    }
  }

  void editForm() async {
    List<Map<String, dynamic>> result =
        dogsForm.map((i) => validator(i)).toList();
    List<dynamic> validatorList = result.map((i) => i['validator']).toList();
    bool isValidator = !validatorList.contains(false);
    try {
      if (isValidator) {
        for (int i = 0; i < dogsForm.length; i++) {
          if (i + 1 <= dogsInfo.length) {
            if (!DogInfoModel.isSame(dogsInfo[i], dogsForm[i])) {
              dio.FormData formData = dio.FormData.fromMap({
                "meetRoute": dogsForm[i].meetRoute,
                "petBirth": dogsForm[i].petBirth.replaceAll('.', '-'),
                "petGender": dogsForm[i].petGender == '남' ? 'BOY' : 'GIRL',
                "petName": dogsForm[i].petName,
                "petSpecies": dogsForm[i].petSpecies,
                if (dogsForm[i].image != null)
                  "image":
                      await dio.MultipartFile.fromFile(dogsForm[i].image!.path)
              });
              await SendAPI.put(
                url: "/profile-service/profile/${dogsForm[i].id}",
                request: formData,
                successFunc: (data) => isChange.value = true,
                errorMsg: "애완동물정보 수정에 실패하였어요",
              );
            }
          } else {
            dio.FormData formData = dio.FormData.fromMap({
              "meetRoute": dogsForm[i].meetRoute,
              "petBirth": dogsForm[i].petBirth.replaceAll('.', '-'),
              "petGender": dogsForm[i].petGender == '남' ? 'BOY' : 'GIRL',
              "petName": dogsForm[i].petName,
              "petSpecies": dogsForm[i].petSpecies,
              if (dogsForm[i].image != null)
                "image":
                    await dio.MultipartFile.fromFile(dogsForm[i].image!.path)
            });
            await SendAPI.post(
              url: "/profile-service/profile",
              request: formData,
              successFunc: (data) => isChange.value = true,
              errorMsg: "애완동물정보 수정에 실패하였어요",
            );
          }
        }
        if (isChange.value) {
          SnackBarWidget.show(SnackBarType.check, '애완동물 정보가 성공적으로 변경되었어요');
          fetchData();
          isChange.value = false;
        }
        setIsEdit(false);
      } else {
        int index = validatorList.indexOf(false);
        isError.value = true;
        slideIndex.value = index;
        SnackBarWidget.show(SnackBarType.error, result[index]['error']);
      }
    } catch (error) {}
  }
}
