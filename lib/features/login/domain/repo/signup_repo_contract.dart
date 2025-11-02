import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/domain/models/signup_model.dart';

abstract class SignupRepoContract {
  Future<BaseResponse<SignupModel>> register (String username , String firstName , String lastName , String email , String password , String rePassword , String phone);
}