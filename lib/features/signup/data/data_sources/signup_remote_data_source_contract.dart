import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/signup/data/models/signup_dto.dart';

abstract class SignupRemoteDataSourceContract {
  Future<BaseResponse<SignupDto>> register (String username , String firstName , String lastName , String email , String password , String rePassword , String phone);
}