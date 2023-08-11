import 'dart:io';

class DogInfoModel {
  final int? id;
  final String meetRoute;
  final String petBirth;
  final String petGender;
  final String petName;
  final String petSpecies;
  final Map<String, dynamic>? s3ResponseDto;
  DogInfoModel({
    required this.id,
    required this.meetRoute,
    required this.petBirth,
    required this.petGender,
    required this.petName,
    required this.petSpecies,
    required this.s3ResponseDto,
  });
  factory DogInfoModel.fromJson(Map<String, dynamic> json) {
    return DogInfoModel(
      id: json['id'],
      meetRoute: json['meetRoute'],
      petBirth: json['petBirth'].replaceAll('-', '.'),
      petGender: json['petGender'],
      petName: json['petName'],
      petSpecies: json['petSpecies'],
      s3ResponseDto: json['s3ResponseDto'],
    );
  }

  static bool isSame(DogInfoModel dogInfoModel, DogFormModel dogFormModel) {
    if (dogInfoModel.meetRoute == dogFormModel.meetRoute &&
        dogInfoModel.petBirth == dogFormModel.petBirth &&
        dogInfoModel.petGender == dogFormModel.petGender &&
        dogInfoModel.petName == dogFormModel.petName &&
        dogInfoModel.petSpecies == dogFormModel.petSpecies &&
        dogFormModel.image == null) {
      return true;
    } else {
      return false;
    }
  }
}

class DogFormModel extends DogInfoModel {
  final File? image;
  DogFormModel({
    required int? id,
    required String meetRoute,
    required String petBirth,
    required String petGender,
    required String petName,
    required String petSpecies,
    required this.image,
    required Map<String, dynamic>? s3ResponseDto,
  }) : super(
          id: id,
          meetRoute: meetRoute,
          petBirth: petBirth,
          petGender: petGender,
          petName: petName,
          petSpecies: petSpecies,
          s3ResponseDto: s3ResponseDto,
        );
  factory DogFormModel.fromJson(Map<String, dynamic> json) {
    return DogFormModel(
      id: json['id'],
      meetRoute: json['meetRoute'],
      petBirth: json['petBirth'].replaceAll('-', '.'),
      petGender: json['petGender'],
      petName: json['petName'],
      petSpecies: json['petSpecies'],
      image: json['image'],
      s3ResponseDto: json['s3ResponseDto'],
    );
  }
}
