import 'dart:io';

class DogInfoModel {
  final int? id;
  final String meetRoute;
  final String petBirth;
  final String petGender;
  final String petName;
  final String petSpecies;
  final File? image;
  final Map<String, dynamic>? s3ResponseDto;
  DogInfoModel({
    required this.id,
    required this.meetRoute,
    required this.petBirth,
    required this.petGender,
    required this.petName,
    required this.petSpecies,
    required this.image,
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
      image: json['image'],
      s3ResponseDto: json['s3ResponseDto'],
    );
  }
}
