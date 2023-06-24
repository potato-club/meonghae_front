import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> saveUserInfo(Map<String, dynamic> userInfo) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'userFileUrl', value: userInfo['fileUrl']);
  await storage.write(key: 'userAge', value: userInfo['age'].toString());
  await storage.write(key: 'userBirth', value: userInfo['birth']);
  await storage.write(key: 'userEmail', value: userInfo['email']);
  await storage.write(key: 'userNickname', value: userInfo['nickname']);
}

Future<dynamic> readUserAge() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'userAge');
}

Future<dynamic> readUserBirth() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'userBirth');
}

Future<dynamic> readUserEmail() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'userEmail');
}

Future<dynamic> readUserNickname() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'userNickname');
}

Future<dynamic> readUserFileUrl() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'userFileUrl');
}

Future<void> deleteUserInfo() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'userAge');
  await storage.delete(key: 'userBirth');
  await storage.delete(key: 'userEmail');
  await storage.delete(key: 'userNickname');
  await storage.delete(key: 'userFileUrl');
}
