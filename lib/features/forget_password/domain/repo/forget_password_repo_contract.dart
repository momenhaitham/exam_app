import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/forget_password/domain/models/forget_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/models/reset_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/models/virefy_reset_code_model.dart';

abstract class ForgetPasswordRepoContract {
  Future<BaseResponse<ForgetPasswordModel>> forgetPassword(String email);
  Future<BaseResponse<VirefyResetCodeModel>> virefyResetCode(String email);
  Future<BaseResponse<ResetPasswordModel>> resetPassword({required String newPassword,required String email});

}