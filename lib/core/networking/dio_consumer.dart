import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_payment/core/dependecies.dart';

import '../constants.dart';

import '../errors/status_code.dart';
import 'base_api.dart';
import 'dio_error_handler.dart';
import 'interceptor.dart';

class DioConsumer implements BaseApi {
  final Dio dio;

  DioConsumer({required this.dio}) {
    (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options
      ..baseUrl = AppConstants.baseApiUrl
      ..followRedirects = false
      ..validateStatus = ((status) {
        return status! < StatusCode.internalServerError;
      });

    dio.interceptors.add(getIt<AppInterceptor>());

    if (kDebugMode) {
      dio.interceptors.add(getIt<LogInterceptor>());
    }
  }

  Future<T> _errorTryCatch<T>(Future<T> Function() function) async {
    try {
      return await function();
    } catch (e) {
      throw DioErrorHandler.handle(e);
    }
  }

  @override
  Future<T> post<T>(
      {required String url,
      Object? data,
      required Map<String, dynamic> body,
      required T Function(Map<String, dynamic> json) fromJson,
      Map<String, dynamic>? queryParameters}) async {
    return _errorTryCatch(() async {
      final response = await dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
      );
      return fromJson(response.data);
    });
  }
}
