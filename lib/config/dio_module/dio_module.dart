import 'package:dio/dio.dart';
import 'package:exam_app_project/features/login/api/api_client/api_client.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
@module
abstract class DioModule {
  @factoryMethod
  Dio provideDio() {
    Dio dio = Dio();
    dio.options = BaseOptions(
      connectTimeout: const Duration(seconds: 180),
      receiveTimeout: const Duration(seconds: 180),
      validateStatus: (_) {
        return true;
      },
    );
    dio.interceptors.add(dioLogger());
    return dio;
  }


  @singleton
  ApiClient apiClient(Dio dio) => ApiClient(dio);



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