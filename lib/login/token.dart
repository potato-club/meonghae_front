import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<void> saveAccessToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'accessToken', value: token);
}

Future<String?> readAccessToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'accessToken');
}

Future<void> deleteAccessToken() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'accessToken');
}

Future<void> saveRefreshToken(String token) async {
  const storage = FlutterSecureStorage();
  await storage.write(key: 'refreshToken', value: token);
}

Future<String?> readRefreshToken() async {
  const storage = FlutterSecureStorage();
  return await storage.read(key: 'refreshToken');
}

Future<void> deleteRefreshToken() async {
  const storage = FlutterSecureStorage();
  await storage.delete(key: 'refreshToken');
}
