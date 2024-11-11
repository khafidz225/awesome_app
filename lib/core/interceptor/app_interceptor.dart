import 'package:awesome_app/core/config/api_config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptor extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['Content-Type'] = 'application/json';
    options.headers['Accept'] = '*/*';
    options.baseUrl = ApiConfig.baseUrl;

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint('Error Message: ${err.message}');
    debugPrint('Error Data: ${err.response?.data}');

    super.onError(err, handler);
  }
}
