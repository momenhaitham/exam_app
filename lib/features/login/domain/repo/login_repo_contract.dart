import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/domain/models/login_model.dart';

abstract class LoginRepoContract {
  Future<BaseResponse<LoginModel>> Login (String email , String password);
}