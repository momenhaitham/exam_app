import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/forget_password/api/api_client/api_client.dart';
import 'package:exam_app_project/features/forget_password/data/data_sources/forget_password_remote_datasource_contract.dart';
import 'package:exam_app_project/features/forget_password/data/models/forget_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/reset_password_dto.dart';
import 'package:exam_app_project/features/forget_password/data/models/virefy_reset_code_dto.dart';
import 'package:injectable/injectable.dart';


@Injectable(as:ForgetPasswordRemoteDatasourceContract)
class ForgetPasswordRemoteDatasourceImpl implements ForgetPasswordRemoteDatasourceContract{
  ForgetPasswordApiClient apiClient;
  ForgetPasswordRemoteDatasourceImpl(this.apiClient);

  Future<BaseResponse<ForgetPasswordDto>> ForgetPassword(String email)async{
    try{
    ForgetPasswordDto FGresponse = await apiClient.forgetPassword({"email":email});
    return SuccessResponse<ForgetPasswordDto>(data: FGresponse);
    }catch(e){
      return ErrorResponse<ForgetPasswordDto>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<VirefyResetCodeDto>> VirefyResetCode(String resetCode)async {
    try{
    VirefyResetCodeDto VRCresponse = await apiClient.verifyResetCode({"resetCode":resetCode});
    return SuccessResponse<VirefyResetCodeDto>(data:VRCresponse);
    }catch(e){
      return ErrorResponse<VirefyResetCodeDto>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<ResetPasswordDto>> ResetPassword({required String newPassword,required String email})async {
    try{
    ResetPasswordDto RPresponse = await apiClient.resetPassword({"email":email,"newPassword":newPassword});
    return SuccessResponse<ResetPasswordDto>(data:RPresponse);
    }catch(e){
      return ErrorResponse<ResetPasswordDto>(error: e as Exception);
    }
  }


}