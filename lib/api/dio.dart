import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/models/loginModel.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class SendAPI {
  static Future<void> tokenRefresh({
    required DioException error,
    required BuildContext context,
    required Function(Options?) requestMethod,
    required Function successFunc,
    required String errorMsg,
  }) async {
    if (jsonDecode(error.response?.data)['errorCode'] == 4002) {
      var refreshToken = await readRefreshToken();
      var mobileId = await LoginModel.getMobileId();
      final dio = Dio(BaseOptions(
        baseUrl: 'https://api.meonghae.site/',
        headers: {'refreshToken': refreshToken, 'androidId': mobileId},
      ));
      try {
        final response = await dio.get('/user-service/reissue');
        saveAccessToken(response.headers['authorization']![0]);
        saveRefreshToken(response.headers['refreshtoken']![0]);
        var _accessToken = await readAccessToken();
        var _refreshToken = await readRefreshToken();
        try {
          final _response = await requestMethod(Options(headers: {
            'Authorization': _accessToken,
            'refreshToken': _refreshToken,
          }));
          successFunc(_response);
        } catch (error) {
          SnackBarWidget.show(context, SnackBarType.error, errorMsg);
        }
      } on DioException catch (error) {
        SnackBarWidget.show(context, SnackBarType.error, error.toString());
      } finally {
        dio.close();
      }
    } else {
      SnackBarWidget.show(context, SnackBarType.error, errorMsg);
    }
  }

  static Future<void> get({
    required BuildContext context,
    required String url,
    required Function successFunc,
    required String errorMsg,
    Map<String, dynamic>? request,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
      headers: {'Authorization': accessToken, 'refreshToken': refreshToken},
    ));
    try {
      final response = request == null
          ? await dio.get(url)
          : await dio.get(url, data: request);
      successFunc(response);
    } on DioException catch (error) {
      tokenRefresh(
        error: error,
        context: context,
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
    required BuildContext context,
    required String url,
    required Function successFunc,
    required String errorMsg,
    dynamic request,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
      headers: {'Authorization': accessToken, 'refreshToken': refreshToken},
    ));
    try {
      final response = request == null
          ? await dio.post(url)
          : await dio.post(url, data: request);
      successFunc(response);
    } on DioException catch (error) {
      tokenRefresh(
        error: error,
        context: context,
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
    required BuildContext context,
    required String url,
    required Function successFunc,
    required String errorMsg,
    dynamic request,
  }) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
      headers: {'Authorization': accessToken, 'refreshToken': refreshToken},
    ));
    try {
      final response = request == null
          ? await dio.put(url)
          : await dio.put(url, data: request);
      successFunc(response);
    } on DioException catch (error) {
      tokenRefresh(
        error: error,
        context: context,
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
    required BuildContext context,
    required String url,
    required Function successFunc,
    required String errorMsg,
    dynamic request,
  }) async {
    var token = await readAccessToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
      headers: {'Authorization': token},
    ));
    try {
      final response = await dio.delete(url, queryParameters: request);
      successFunc();
    } on DioException catch (error) {
      tokenRefresh(
        error: error,
        context: context,
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
