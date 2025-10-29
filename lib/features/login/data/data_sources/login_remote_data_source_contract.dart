import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/api/api_client/api_client.dart';
import 'package:exam_app_project/features/login/data/models/log_dto.dart';

abstract class LoginRemoteDataSourceContract {
  Future<BaseResponse<LoginDto>> Login (String email , String password);
}