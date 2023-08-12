class UserInfoModel {
  final int age;
  final String birth;
  final String email;
  final String? fileName;
  final String? fileUrl;
  final String nickname;
  UserInfoModel({
    required this.age,
    required this.birth,
    required this.email,
    this.fileName,
    this.fileUrl,
    required this.nickname,
  });
  factory UserInfoModel.fromJson(Map<String, dynamic> json) {
    return UserInfoModel(
      age: json['age'],
      birth: json['birth'].replaceAll('-', '.'),
      email: json['email'],
      fileName: json['fileName'],
      fileUrl: json['fileUrl'],
      nickname: json['nickname'],
    );
  }
}
