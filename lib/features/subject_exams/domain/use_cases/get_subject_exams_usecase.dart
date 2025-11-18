import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/subject_exams/domain/models/subject_exmas_model.dart';
import 'package:exam_app_project/features/subject_exams/domain/repos/subject_exams_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubjectExamsUsecase {
  SubjectExamsRepoContract repoContract;
  GetSubjectExamsUsecase(this.repoContract);

  Future<BaseResponse<SubjectExmasModel>> getSubjectExams(String subject) async{
    return await repoContract.getSubjectExams(subject);
  }

}