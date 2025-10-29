import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/api/api_client/api_client.dart';
import 'package:exam_app_project/features/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:exam_app_project/features/login/data/models/log_dto.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:LoginRemoteDataSourceContract)
class LoginRemoteDateSourceImpl implements LoginRemoteDataSourceContract{

  LoginApiClient loginApiClient;
  LoginRemoteDateSourceImpl(this.loginApiClient);

  @override
  Future<BaseResponse<LoginDto>> Login(String email, String password) async{
    try{
      LoginDto loginResponse = await loginApiClient.Login(email, password);
      return SuccessResponse<LoginDto>(data: loginResponse);
    }catch(e){
      return ErrorResponse<LoginDto>(error: e as Exception);
    }
  }
}