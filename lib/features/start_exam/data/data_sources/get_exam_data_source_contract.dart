import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/start_exam/data/models/exam_dto.dart';

abstract class GetExamDataSourceContrcat {
  Future<BaseResponse<ExamDto>> startExam(String examId);
}