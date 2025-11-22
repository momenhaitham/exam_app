import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/domain/models/subject_exmas_model.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/domain/repos/subject_exams_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllExamsUsecase {
  SubjectExamsRepoContract repoContract;
  GetAllExamsUsecase(this.repoContract);

  Future<BaseResponse<SubjectExmasModel>> getAllExams(String? token) async{
    return await repoContract.getAllExams(token);
  }

}