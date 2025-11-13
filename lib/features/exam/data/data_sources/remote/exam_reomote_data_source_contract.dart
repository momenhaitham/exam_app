import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/exam/data/models/question_dto.dart';

abstract class ExamReomoteDataSourceContract {
  Future<BaseResponse<List<QuestionDto>>> getQuestions({
    required String examId,
    required String token,
  });
}
