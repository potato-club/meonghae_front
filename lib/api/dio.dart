import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meonghae_front/login/token.dart';
import 'package:meonghae_front/widgets/common/snack_bar_widget.dart';

class SendAPI {
  static Future<void> get({
    required BuildContext context,
    required String url,
    required Function successFunc,
    required String errorMsg,
    Map<String, dynamic>? request,
    int successCode = 200,
  }) async {
    var token = await readAccessToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
      headers: {'Authorization': token},
    ));
    try {
      final response = await dio.get(url, queryParameters: request);
      if (response.statusCode == successCode) {
        successFunc(response.data);
      } else {
        SnackBarWidget.show(context, SnackBarType.error, errorMsg);
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  static Future<void> post({
    required BuildContext context,
    required String url,
    required Function successFunc,
    required String errorMsg,
    dynamic request,
    int successCode = 200,
  }) async {
    var token = await readAccessToken();
    final dio = Dio(BaseOptions(
      baseUrl: 'https://api.meonghae.site/',
      headers: {'Authorization': token},
    ));
    try {
      final response = await dio.post(url, data: request);
      if (response.statusCode == successCode) {
        successFunc();
      } else {
        SnackBarWidget.show(context, SnackBarType.error, errorMsg);
      }
    } catch (error) {
      SnackBarWidget.show(context, SnackBarType.error, error.toString());
    }
  }

  // static Future<void> put({
  //   required BuildContext context,
  //   required String url,
  //   required Function successFunc,
  //   required String errorMsg,
  //   Map<String, dynamic>? request,
  //   int successCode = 200,
  // }) async {
  //   var token = await readAccessToken();
  //   final dio = Dio(BaseOptions(
  //     baseUrl: 'https://api.meonghae.site/',
  //     headers: {'Authorization': token},
  //   ));
  //   try {
  //     final response = await dio.put(url, queryParameters: request);
  //     if (response.statusCode == successCode) {
  //       successFunc();
  //     } else {
  //       SnackBarWidget.show(context, SnackBarType.error, errorMsg);
  //     }
  //   } catch (error) {
  //     SnackBarWidget.show(context, SnackBarType.error, error.toString());
  //   }
  // }

  // static Future<void> delete({
  //   required BuildContext context,
  //   required String url,
  //   required Function successFunc,
  //   required String errorMsg,
  //   Map<String, dynamic>? request,
  //   int successCode = 200,
  // }) async {
  //   var token = await readAccessToken();
  //   final dio = Dio(BaseOptions(
  //     baseUrl: 'https://api.meonghae.site/',
  //     headers: {'Authorization': token},
  //   ));
  //   try {
  //     final response = await dio.delete(url, queryParameters: request);
  //     if (response.statusCode == successCode) {
  //       successFunc();
  //     } else {
  //       SnackBarWidget.show(context, SnackBarType.error, errorMsg);
  //     }
  //   } catch (error) {
  //     SnackBarWidget.show(context, SnackBarType.error, error.toString());
  //   }
  // }
}
