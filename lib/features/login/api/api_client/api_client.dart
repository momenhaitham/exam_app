import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/models/log_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl:AppEndpoints.baseUrl)
abstract class LoginApiClient {
  factory LoginApiClient(Dio dio, {String? baseUrl}) = _LoginApiClient;

  @GET(AppEndpoints.LoginEndpoint)
  Future<LoginDto> Login(@Query("email") String email, @Query("password") String password,);
}