import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/api/api_client/api_client.dart';
import 'package:exam_app_project/features/signup/api/api_client/api_client.dart';
import 'package:exam_app_project/features/signup/data/data_sources/signup_remote_data_source_contract.dart';
import 'package:exam_app_project/features/signup/data/models/signup_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:SignupRemoteDataSourceContract)
class SignupRemoteDataSourceImpl implements SignupRemoteDataSourceContract {
  SignupApiClient signupApiClient;
  SignupRemoteDataSourceImpl(this.signupApiClient);

  @override
  Future<BaseResponse<SignupDto>> register(String username, String firstName, String lastName, String email, String password, String rePassword, String phone) async{
    try {
      SignupDto signupResponse = await signupApiClient.register({
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "rePassword": rePassword,
        "phone": phone,
      });
      return SuccessResponse<SignupDto>(data: signupResponse);
    } catch (e) {
      return ErrorResponse<SignupDto>(error: e as Exception);
    }
  }
}