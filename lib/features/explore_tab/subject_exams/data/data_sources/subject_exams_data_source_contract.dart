import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/data/models/subject_exams_dto.dart';

abstract class SubjectExamsDataSourceContract {
  Future<BaseResponse<SubjectExamsDto>> getSubjectExams(String? subject,String? token);
  Future<BaseResponse<SubjectExamsDto>> getAllExams(String? token);
}