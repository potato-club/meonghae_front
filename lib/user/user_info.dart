import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
  final storage = const FlutterSecureStorage();
  await storage.write(key: 'userAge', value: userInfo['age'] as String);
  await storage.write(key: 'userBirth', value: userInfo['birth']);
  await storage.write(key: 'userEmail', value: userInfo['email']);
  await storage.write(key: 'userNickname', value: userInfo['nickname']);
}

Future<String?> readUserAge() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userAge');
}

Future<String?> readUserBirth() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userBirth');
}

Future<String?> readUserEmail() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userEmail');
}

Future<String?> readUserNickname() async {
  final storage = const FlutterSecureStorage();
  return await storage.read(key: 'userNickname');
}

Future<void> deleteUserInfo() async {
  final storage = const FlutterSecureStorage();
  await storage.delete(key: 'userAge');
  await storage.delete(key: 'userBirth');
  await storage.delete(key: 'userEmail');
  await storage.delete(key: 'userNickname');
}
