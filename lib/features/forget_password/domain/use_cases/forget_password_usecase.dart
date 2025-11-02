import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/forget_password/domain/models/forget_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/repo/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordUsecase {
  ForgetPasswordRepoContract repo;
  ForgetPasswordUsecase(this.repo);

  Future<BaseResponse<ForgetPasswordModel>> call(String email)async => await repo.forgetPassword(email);
}