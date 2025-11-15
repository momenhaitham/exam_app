import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio => Dio(BaseOptions(baseUrl: AppEndpoints.baseUrl));
}