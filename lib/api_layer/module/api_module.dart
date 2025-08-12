import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/core/utils/api_constants.dart';
import 'package:online_exam/core/utils/constatnts.dart';
import 'package:pretty_dio_logger/src/pretty_dio_logger.dart';

@module
abstract class ApiModule {
  @singleton
  PrettyDioLogger provideDioLogger() {
    return PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
        filter: (options, args) {
          // don't print requests with uris containing '/posts'
          if (options.path.contains('/posts')) {
            return false;
          }
          // don't print responses with unit8 list data
          return !args.isResponse || !args.hasUint8ListData;
        });
  }

  @singleton
  Dio provideDio(PrettyDioLogger logger) {
    var dio = Dio(BaseOptions(
        headers: {"token": ApiConstants.token},
        baseUrl: Constants.baseURL,
        connectTimeout: const Duration(seconds: 20),
        receiveTimeout: const Duration(seconds: 20)));
    dio.interceptors.add(logger);
    return dio;
  }

  @Named('BaseUrl')
  String get baseUrl => Constants.baseURL;
}
