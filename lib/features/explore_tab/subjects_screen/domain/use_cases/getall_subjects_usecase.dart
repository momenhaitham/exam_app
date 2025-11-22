import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_response_model.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/repo/getall_subjects_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetallSubjectsUsecase {
  GetallSubjectsRepoContract subjectsRepoContract;
  GetallSubjectsUsecase(this.subjectsRepoContract);
  Future<BaseResponse<SubjectsResponseModel>> call (String? tokin)async => await subjectsRepoContract.GetAllSubjects(tokin);
}