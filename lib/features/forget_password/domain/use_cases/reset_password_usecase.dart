import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/forget_password/domain/models/reset_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/repo/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ResetPasswordUsecase {
  ForgetPasswordRepoContract repo;
  ResetPasswordUsecase(this.repo);

  Future<BaseResponse<ResetPasswordModel>> call({required  newPassword,required String email})async =>await repo.resetPassword(newPassword: newPassword, email: email) ;
}
