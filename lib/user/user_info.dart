import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
  print(userInfo['fileUrl']);
  final storage = const FlutterSecureStorage();
  await storage.write(key: 'userFileUrl', value: userInfo['fileUrl']);
  await storage.write(key: 'userAge', value: userInfo['age']);
  await storage.write(key: 'userBirth', value: userInfo['birth']);
  await storage.write(key: 'userEmail', value: userInfo['email']);
  await storage.write(key: 'userNickname', value: userInfo['nickname']);
}

Future<dynamic?> readUserAge() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userAge');
}

Future<dynamic?> readUserBirth() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userBirth');
}

Future<dynamic?> readUserEmail() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userEmail');
}

Future<dynamic?> readUserNickname() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userNickname');
}

Future<dynamic?> readUserFileUrl() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userFileUrl');
}

Future<void> deleteUserInfo() async {
  final storage = const FlutterSecureStorage();
  await storage.delete(key: 'userAge');
  await storage.delete(key: 'userBirth');
  await storage.delete(key: 'userEmail');
  await storage.delete(key: 'userNickname');
  await storage.delete(key: 'userFileUrl');
}
