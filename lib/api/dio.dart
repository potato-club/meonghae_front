import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/models/login_Model.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class SendAPI {
  static Future<void> tokenRefresh({
    required DioException error,
    required Function(Options?) requestMethod,
    required Function successFunc,
    required String errorMsg,
  }) async {
    if (error.response?.data['errorCode'] != null) {
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
            SnackBarWidget.show(SnackBarType.error, error.toString());
          }
        } on DioException catch (error) {
          SnackBarWidget.show(SnackBarType.error, error.toString());
        } finally {
          dio.close();
        }
      } else {
        SnackBarWidget.show(SnackBarType.error, errorMsg);
      }
    } else {
      SnackBarWidget.show(SnackBarType.error, error.toString());
    }
  }

  static Future<void> get(
      {required String url,
      int successCode = 200,
      required Function successFunc,
      required String errorMsg,
      Map<String, dynamic>? request,
      Map<String, dynamic>? params}) async {
    var accessToken = await readAccessToken();
    var refreshToken = await readRefreshToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
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
  }) async {
    var token = await readAccessToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
      headers: {'Authorization': token},
    ));
    try {
      final response = await dio.delete(url, queryParameters: request);
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
            Dio().delete('https://api.meonghae.site$url', options: options),
      );
    } finally {
      dio.close();
    }
  }
}
