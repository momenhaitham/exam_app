import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/domain/models/subject_exmas_model.dart';

abstract class SubjectExamsRepoContract {
  Future<BaseResponse<SubjectExmasModel>> getSubjectExams(String? subject,String? token);
  Future<BaseResponse<SubjectExmasModel>> getAllExams(String? token);
}