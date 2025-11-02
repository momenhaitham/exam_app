import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/features/login/data/models/signup_dto.dart';
import 'package:retrofit/retrofit.dart';

import '../../data/models/log_dto.dart';

part 'api_client.g.dart';

@RestApi(baseUrl:AppEndpoints.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET(AppEndpoints.LoginEndpoint)
  Future<LoginDto> Login(@Query("email") String email, @Query("password") String password,);

  @POST(AppEndpoints.registerEndpoint)
  Future<SignupDto> register(@Body() Map<String, dynamic> body);
}