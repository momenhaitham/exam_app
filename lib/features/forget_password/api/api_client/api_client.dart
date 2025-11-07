import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/features/forget_password/data/models/forget_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/reset_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/virefy_reset_code_dto.dart';
import 'package:injectable/injectable.dart';
// ignore: unused_import
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';
@injectable
@RestApi()
abstract class ForgetPasswordApiClient {
  @factoryMethod
  factory ForgetPasswordApiClient(Dio dio) = _ForgetPasswordApiClient;

  @POST(AppEndpoints.ForgotPasswordEndpoint)
  Future<ForgetPasswordDto> forgetPassword(@Body() Map<String, dynamic> body);
  
  @POST(AppEndpoints.VerifyResetCode)
  Future<VirefyResetCodeDto> verifyResetCode(@Body() Map<String, dynamic> body);

  @PUT(AppEndpoints.ResetPassword)
  Future<ResetPasswordDto> resetPassword(@Body() Map<String, dynamic> body);
}

