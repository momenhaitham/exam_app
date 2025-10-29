import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/data/data_sources/login_remote_data_source_contract.dart';
import 'package:exam_app_project/features/login/data/models/log_dto.dart';
import 'package:exam_app_project/features/login/domain/models/login_model.dart';
import 'package:exam_app_project/features/login/domain/repo/login_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as:LoginRepoContract)
class LoginRepoImpl implements LoginRepoContract{
  

  LoginRemoteDataSourceContract LoginRemote;

  LoginRepoImpl(this.LoginRemote);
  
  @override
  Future<BaseResponse<LoginModel>> Login(String email, String password) async{
    BaseResponse<LoginDto> loginResponse =await LoginRemote.Login(email, password);
    switch(loginResponse){
      case SuccessResponse<LoginDto>():
      LoginModel loginModel = loginResponse.data.toModel();
      return SuccessResponse<LoginModel>(data: loginModel);

      case ErrorResponse<LoginDto>():
      return ErrorResponse<LoginModel>(error: loginResponse.error);
    }
  }
}