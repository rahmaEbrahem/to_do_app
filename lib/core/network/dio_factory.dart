import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:to_do_app/core/helper/app_preferences.dart';

class DioFactory {
  static late Dio dio;
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://api.gosorsolutions.com/api/",
        connectTimeout: Duration(seconds: 30),
        receiveTimeout: Duration(seconds: 30),
      ),
    );
    initlogger();
    initAuthInterceptor();
  }

  static initlogger() {
    dio.interceptors.add(
      PrettyDioLogger(
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
        },
      ),
    );
  }

  static void initAuthInterceptor() {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = AppPreferences.getToken();

          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }

          options.headers['Accept'] = 'application/json';

          handler.next(options);
        },
      ),
    );
  }
}
