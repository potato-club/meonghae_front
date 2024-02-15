// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/models/login_model.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class SendAPI {
  static FormData getAnotherFormData(FormData formData) {
    FormData anotherFormData = FormData();
    formData.fields.forEach((MapEntry<String, dynamic> entry) {
      anotherFormData.fields
          .add(MapEntry<String, String>(entry.key, entry.value));
    });
    return anotherFormData;
  }

  static Future<bool> tokenRefresh({required DioException error}) async {
    int? errorCode;
    if (error.response?.data.runtimeType == String) {
      errorCode = jsonDecode(error.response?.data)['errorCode'];
    } else {
      error.response?.data['errorCode'];
    }
    switch (errorCode) {
      case 4001:
      case 4003:
      case 4005:
        {
          return false;
        }
      case 4002:
        {
          var refreshToken = await readRefreshToken();
          var mobileId = await LoginModel.getMobileId();
          final dio = Dio(BaseOptions(
            baseUrl: dotenv.env['SERVER_URL']!,
            headers: {'RefreshToken': refreshToken, 'androidId': mobileId},
          ));
          try {
            final response = await dio.get('/user-service/reissue');
            saveAccessToken(response.headers['authorization']![0]);
            saveRefreshToken(response.headers['refreshtoken']![0]);
            return true;
          } on DioException catch (error) {
            LoginModel.logout();
            SnackBarWidget.show(SnackBarType.error, "만료된 토큰이에요");
            return false;
          } finally {
            dio.close();
          }
        }
      default:
        {
          // LoginModel.logout();
          return false;
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
      headers: {'Authorization': accessToken, 'RefreshToken': refreshToken},
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
      var refreshSuccess = await tokenRefresh(error: error);
      if (refreshSuccess) {
        try {
          get(
            url: url,
            successFunc: successFunc,
            successCode: successCode,
            errorMsg: errorMsg,
            request: request,
            params: params,
          );
        } catch (error) {
          SnackBarWidget.show(SnackBarType.error, errorMsg);
        }
      }
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
    bool isFormData = false,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    var fcmToken = await FirebaseMessaging.instance
        .getToken(vapidKey: dotenv.env['FCM_VAPID_KEY']);
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL']!,
      headers: {
        'Authorization': accessToken,
        'RefreshToken': refreshToken,
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
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } on DioException catch (error) {
      var refreshSuccess = await tokenRefresh(error: error);
      if (refreshSuccess) {
        var request_ = request;
        if (isFormData) {
          request_ = getAnotherFormData(request);
        }
        try {
          post(
            url: url,
            successFunc: successFunc,
            successCode: successCode,
            errorMsg: errorMsg,
            request: request_,
            params: params,
          );
        } catch (error) {
          SnackBarWidget.show(SnackBarType.error, errorMsg);
        }
      }
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
    bool isFormData = false,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: dotenv.env['SERVER_URL']!,
      headers: {'Authorization': accessToken, 'RefreshToken': refreshToken},
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
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } on DioException catch (error) {
      var refreshSuccess = await tokenRefresh(error: error);
      if (refreshSuccess) {
        var request_ = request;
        if (isFormData) {
          request_ = getAnotherFormData(request);
        }
        try {
          put(
            url: url,
            successFunc: successFunc,
            successCode: successCode,
            errorMsg: errorMsg,
            request: request_,
            params: params,
          );
        } catch (error) {
          SnackBarWidget.show(SnackBarType.error, errorMsg);
        }
      }
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
      headers: {'Authorization': accessToken, 'RefreshToken': refreshToken},
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
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } on DioException catch (error) {
      var refreshSuccess = await tokenRefresh(error: error);
      if (refreshSuccess) {
        try {
          delete(
            url: url,
            successFunc: successFunc,
            successCode: successCode,
            errorMsg: errorMsg,
            request: request,
            params: params,
          );
        } catch (error) {
          SnackBarWidget.show(SnackBarType.error, errorMsg);
        }
      }
    } finally {
      dio.close();
    }
  }
}
