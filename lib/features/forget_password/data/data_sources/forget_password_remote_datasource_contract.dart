import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/forget_password/data/models/forget_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/reset_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/virefy_reset_code_dto.dart';

abstract class ForgetPasswordRemoteDatasourceContract {
Future<BaseResponse<ForgetPasswordDto>> ForgetPassword(String email);
Future<BaseResponse<VirefyResetCodeDto>> VirefyResetCode(String code);
Future<BaseResponse<ResetPasswordDto>> ResetPassword({required String newPassword,required String email});
}