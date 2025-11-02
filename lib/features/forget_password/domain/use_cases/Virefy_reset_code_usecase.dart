import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/forget_password/domain/models/virefy_reset_code_model.dart';
import 'package:exam_app_project/features/forget_password/domain/repo/forget_password_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class VirefyResetCodeUsecase {
  ForgetPasswordRepoContract repo;
  VirefyResetCodeUsecase(this.repo);

  Future<BaseResponse<VirefyResetCodeModel>> call(String code)async => await repo.virefyResetCode(code);
}