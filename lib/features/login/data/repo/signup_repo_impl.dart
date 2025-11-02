import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/data/data_sources/signup_remote_data_source_contract.dart';
import 'package:exam_app_project/features/login/data/models/signup_dto.dart';
import 'package:exam_app_project/features/login/domain/models/signup_model.dart';
import 'package:exam_app_project/features/login/domain/repo/signup_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:SignupRepoContract)
class SignupRepoImpl implements SignupRepoContract{
  SignupRemoteDataSourceContract signupRemote;
  SignupRepoImpl(this.signupRemote);
  @override
  Future<BaseResponse<SignupModel>> register(String username, String firstName, String lastName, String email, String password, String rePassword, String phone) async {
    BaseResponse<SignupDto> signupResponse = await signupRemote.register(username, firstName, lastName, email, password, rePassword, phone);
    switch(signupResponse){
      case SuccessResponse<SignupDto>():
      SignupModel signupModel = signupResponse.data.toModel();
      return SuccessResponse<SignupModel>(data: signupModel);

      case ErrorResponse<SignupDto>():
      return ErrorResponse<SignupModel>(error: signupResponse.error);
    }
  }
}