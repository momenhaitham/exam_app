import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/login/domain/models/login_model.dart';
import 'package:exam_app_project/features/login/domain/repo/login_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUsecase {
  LoginRepoContract Repo;
  LoginUsecase(this.Repo);

  Future<BaseResponse<LoginModel>> call(String email,String password)async{
    return await Repo.Login(email, password);
  }
}