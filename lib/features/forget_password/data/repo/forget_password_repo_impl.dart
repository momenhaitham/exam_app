import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/forget_password/data/data_sources/forget_password_remote_datasource_contract.dart';
import 'package:exam_app_project/features/forget_password/data/models/forget_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/reset_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/virefy_reset_code_dto.dart';
import 'package:exam_app_project/features/forget_password/domain/models/forget_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/models/reset_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/models/virefy_reset_code_model.dart';
import 'package:exam_app_project/features/forget_password/domain/repo/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:ForgetPasswordRepoContract)
class ForgetPasswordRepoImpl implements ForgetPasswordRepoContract {

  ForgetPasswordRemoteDatasourceContract dataSource;
  ForgetPasswordRepoImpl(this.dataSource);


  @override
  Future<BaseResponse<ForgetPasswordModel>> forgetPassword(String email) async{

    BaseResponse<ForgetPasswordDto> ForgetPasswordResponse = await dataSource.ForgetPassword(email);
    switch(ForgetPasswordResponse){
      
      case SuccessResponse<ForgetPasswordDto>():
        ForgetPasswordModel forgetPasswordModel = ForgetPasswordResponse.data.ToModel();
        return SuccessResponse<ForgetPasswordModel>(data: forgetPasswordModel);
      case ErrorResponse<ForgetPasswordDto>():
        return ErrorResponse(error: ForgetPasswordResponse.error);
    }
  }

  @override
  Future<BaseResponse<VirefyResetCodeModel>> virefyResetCode(String resetCode) async{
    BaseResponse<VirefyResetCodeDto> VirefyResetCodeResponse = await dataSource.VirefyResetCode(resetCode);
    switch(VirefyResetCodeResponse) {
      case SuccessResponse<VirefyResetCodeDto>():
        VirefyResetCodeModel virefyResetCodeModel = VirefyResetCodeResponse.data.ToModel();
        return SuccessResponse<VirefyResetCodeModel>(data: virefyResetCodeModel);
      case ErrorResponse<VirefyResetCodeDto>():
        return ErrorResponse<VirefyResetCodeModel>(error: VirefyResetCodeResponse.error);
    }
  }

  @override
  Future<BaseResponse<ResetPasswordModel>> resetPassword({required String newPassword,required String email})async {
    BaseResponse<ResetPasswordDto> ResetPasswordResponse = await dataSource.ResetPassword(email:email ,newPassword:newPassword);
    switch(ResetPasswordResponse) {
      case SuccessResponse<ResetPasswordDto>():
        ResetPasswordModel resetPasswordModel = ResetPasswordResponse.data.ToModel();
        return SuccessResponse<ResetPasswordModel>(data: resetPasswordModel);
      case ErrorResponse<ResetPasswordDto>():
        return ErrorResponse<ResetPasswordModel>(error: ResetPasswordResponse.error);
    }
  }
}