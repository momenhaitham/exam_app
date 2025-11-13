import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';

abstract class ExamRepoContract {
  Future<BaseResponse<List<QuestionModel>>> getQuestions({
    required String examId,
    required String token,
  });
}
