import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


@module
abstract class DioModule {
  @factoryMethod
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 180),
        receiveTimeout: const Duration(seconds: 180),
        baseUrl: AppEndpoints.baseUrl,
        validateStatus: (_) => true,
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTNiZDY2OGZiMTlhZDk1NWIyNmRiYiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYyOTUyNDkzfQ.MO3i18rcQOqX2KqzIi9OrfjeFSK3G_ROhuQ3bA_9u10';
          return handler.next(options);
        },
      ),
    );

    dio.interceptors.add(dioLogger());
    return dio;
  }

  @factoryMethod
  PrettyDioLogger dioLogger() {
    return PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 140,
    );
  }
}