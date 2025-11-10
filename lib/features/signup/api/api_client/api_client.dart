import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:injectable/injectable.dart';
import 'package:exam_app_project/features/signup/data/models/signup_dto.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@injectable
@RestApi()
abstract class SignupApiClient {
  @factoryMethod
  factory SignupApiClient(Dio dio) = _SignupApiClient;

  @POST(AppEndpoints.registerEndpoint)
  Future<SignupDto> register(@Body() Map<String, dynamic> body);
}