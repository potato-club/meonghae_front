import 'dart:io';

class InfoModel {
  String petGender;
  String petSpecies;
  String meetRoute;
  String petName;
  String petBirth;
  File? file;

  InfoModel({
    required this.petGender,
    required this.petSpecies,
    required this.meetRoute,
    required this.petName,
    required this.petBirth,
    this.file,
  });

  Map<String, dynamic> toJson() {
    return {
      'petGender': petGender,
      'petSpecies': petSpecies,
      'meetRoute': meetRoute,
      'petName': petName,
      'petBirth': petBirth.replaceAll('.', '-'),
      'file': file
    };
  }
}
