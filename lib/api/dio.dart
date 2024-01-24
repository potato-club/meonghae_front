import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:meonghae_front/config/app_routes.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/models/login_,model.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class SendAPI {
  static Future<void> tokenRefresh({
    required DioException error,
    required Function(Options?) requestMethod,
    required Function successFunc,
    required String errorMsg,
  }) async {
    int? errorCode;
    if (error.response?.data.runtimeType == String) {
      errorCode = jsonDecode(error.response?.data)['errorCode'];
    } else {
      error.response?.data['errorCode'];
    }
    print(errorCode);
    switch (errorCode) {
      case 4002:
        {
          var refreshToken = await readRefreshToken();
          var mobileId = await LoginModel.getMobileId();
          final dio = Dio(BaseOptions(
            baseUrl: dotenv.env['SERVER_URL']!,
            headers: {'refreshToken': refreshToken, 'androidId': mobileId},
          ));
          try {
            final response = await dio.get('/user-service/reissue');
            saveAccessToken(response.headers['authorization']![0]);
            saveRefreshToken(response.headers['refreshtoken']![0]);
            var accessToken = await readAccessToken();
            var refreshToken_ = await readRefreshToken();
            try {
              final response_ = await requestMethod(Options(headers: {
                'Authorization': accessToken,
                'refreshToken': refreshToken_,
              }));
              successFunc(response_);
            } catch (error) {
              deleteAccessToken();
              deleteRefreshToken();
              Get.offNamed(AppRoutes.login);
              SnackBarWidget.show(SnackBarType.error, error.toString());
            }
          } on DioException catch (error) {
            deleteAccessToken();
            deleteRefreshToken();
            Get.offNamed(AppRoutes.login);
            SnackBarWidget.show(SnackBarType.error, "만료된 토큰이에요");
          } finally {
            dio.close();
          }
        }
      default:
        {
          var refreshToken = await readRefreshToken();
          var mobileId = await LoginModel.getMobileId();
          final dio = Dio(BaseOptions(
            baseUrl: dotenv.env['SERVER_URL']!,
            headers: {'refreshToken': refreshToken, 'androidId': mobileId},
          ));
          try {
            final response = await dio.get('/user-service/reissue');
            saveAccessToken(response.headers['authorization']![0]);
            saveRefreshToken(response.headers['refreshtoken']![0]);
            var accessToken = await readAccessToken();
            var refreshToken0 = await readRefreshToken();
            try {
              final response0 = await requestMethod(Options(headers: {
                'Authorization': accessToken,
                'refreshToken': refreshToken0,
              }));
              successFunc(response0);
            } catch (error) {
              SnackBarWidget.show(SnackBarType.error, "1#.${error.toString()}");
            }
          } on DioException catch (error) {
            SnackBarWidget.show(SnackBarType.error, "2#.${error.toString()}");
          } finally {
            dio.close();
          }
        }
    }
  }

  static Future<void> get({
    required String url,
    int successCode = 200,
    required Function successFunc,
    required String errorMsg,
    Map<String, dynamic>? request,
    Map<String, dynamic>? params,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL']!,
      headers: {'Authorization': accessToken, 'refreshToken': refreshToken},
    ));
    try {
      final response = request == null
          ? params == null
              ? await dio.get(url)
              : await dio.get(url, queryParameters: params)
          : params == null
              ? await dio.get(url, data: request)
              : await dio.get(url, data: request, queryParameters: params);
      if (response.statusCode == successCode) {
        successFunc(response);
      } else {
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } on DioException catch (error) {
      tokenRefresh(
        error: error,
        successFunc: successFunc,
        errorMsg: errorMsg,
        requestMethod: (options) =>
            Dio().get('https://api.meonghae.site$url', options: options),
      );
    } finally {
      dio.close();
    }
  }

  static Future<void> post({
    required String url,
    int successCode = 200,
    required Function successFunc,
    required String errorMsg,
    dynamic request,
    dynamic params,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    var fcmToken = await FirebaseMessaging.instance
        .getToken(vapidKey: dotenv.env['FCM_VAPID_KEY']);
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL']!,
      headers: {
        'Authorization': accessToken,
        'refreshToken': refreshToken,
        'FCMToken': fcmToken
      },
    ));
    try {
      final response = request == null
          ? params == null
              ? await dio.post(url)
              : await dio.post(url, queryParameters: params)
          : params == null
              ? await dio.post(url, data: request)
              : await dio.post(url, data: request, queryParameters: params);
      if (response.statusCode == successCode) {
        successFunc(response);
      } else {
        print(response);
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } on DioException catch (error) {
      tokenRefresh(
        error: error,
        successFunc: successFunc,
        errorMsg: errorMsg,
        requestMethod: (options) =>
            Dio().post('https://api.meonghae.site$url', options: options),
      );
    } finally {
      dio.close();
    }
  }

  static Future<void> put({
    required String url,
    int successCode = 200,
    required Function successFunc,
    required String errorMsg,
    dynamic request,
    dynamic params,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL']!,
      headers: {'Authorization': accessToken, 'refreshToken': refreshToken},
    ));
    try {
      final response = request == null
          ? params == null
              ? await dio.put(url)
              : await dio.put(url, queryParameters: params)
          : params == null
              ? await dio.put(url, data: request)
              : await dio.put(url, data: request, queryParameters: params);
      if (response.statusCode == successCode) {
        successFunc(response);
      } else {
        print(response);
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } on DioException catch (error) {
      print(error);
      tokenRefresh(
        error: error,
        successFunc: successFunc,
        errorMsg: errorMsg,
        requestMethod: (options) =>
            Dio().put('https://api.meonghae.site$url', options: options),
      );
    } finally {
      dio.close();
    }
  }

  static Future<void> delete({
    required String url,
    int successCode = 200,
    required Function successFunc,
    required String errorMsg,
    dynamic request,
    dynamic params,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL']!,
      headers: {'Authorization': accessToken, 'refreshToken': refreshToken},
    ));
    try {
      final response = request == null
          ? params == null
              ? await dio.delete(url)
              : await dio.delete(url, queryParameters: params)
          : params == null
              ? await dio.delete(url, data: request)
              : await dio.delete(url, data: request, queryParameters: params);
      if (response.statusCode == successCode) {
        successFunc(response);
      } else {
        print(response);
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } on DioException catch (error) {
      print(error);
      tokenRefresh(
        error: error,
        successFunc: successFunc,
        errorMsg: errorMsg,
        requestMethod: (options) =>
            Dio().delete('https://api.meonghae.site$url', options: options),
      );
    } finally {
      dio.close();
    }
  }
}
