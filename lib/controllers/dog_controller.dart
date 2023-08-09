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

  void clearDogsInfo() {
    dogsInfo.clear();
    slideIndex.value = 0;
  }

  void addDogInfo() {
    dogsInfo.add(DogInfoModel(
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

  void pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      dogsInfo[slideIndex.value] = DogInfoModel(
        id: dogsInfo[slideIndex.value].id,
        meetRoute: dogsInfo[slideIndex.value].meetRoute,
        petBirth: dogsInfo[slideIndex.value].petBirth,
        petGender: dogsInfo[slideIndex.value].petGender,
        petName: dogsInfo[slideIndex.value].petName,
        petSpecies: dogsInfo[slideIndex.value].petSpecies,
        image: File(pickedFile.path),
        s3ResponseDto: dogsInfo[slideIndex.value].s3ResponseDto,
      );
    }
  }

  void submitForm() async {
    List<Map<String, dynamic>> result =
        dogsInfo.map((i) => validator(i)).toList();
    List<dynamic> validatorList = result.map((i) => i['validator']).toList();
    bool isValidator = !validatorList.contains(false);
    if (isValidator) {
      for (var dogInfo in dogsInfo) {
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
}
