import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/signup/domain/models/signup_model.dart';
import 'package:exam_app_project/features/signup/domain/repo/signup_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUsecase {
  SignupRepoContract repo;
  SignupUsecase(this.repo);

  Future<BaseResponse<SignupModel>> call(String username , String firstName , String lastName , String email , String password , String rePassword , String phone)async{
    return await repo.register(username, firstName, lastName, email, password, rePassword, phone);
  }
}