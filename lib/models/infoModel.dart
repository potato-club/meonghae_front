import 'dart:io';

class InfoModel {
  String gender;
  String kind;
  String place;
  String name;
  String birth;
  File? imageFile;

  InfoModel({
    required this.gender,
    required this.kind,
    required this.place,
    required this.name,
    required this.birth,
    this.imageFile,
  });
}
