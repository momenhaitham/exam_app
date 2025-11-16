// features/exam/domain/repo/exam_repo_contract.dart
import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';
import 'package:exam_app_project/features/exam/domain/models/answer_item_model.dart';
import 'package:exam_app_project/features/exam/domain/models/check_answers_result_model.dart';

abstract class ExamRepoContract {
  Future<BaseResponse<List<QuestionModel>>> getQuestions({
    required String examId,
    required String token,
  });

  Future<BaseResponse<CheckAnswersResultModel>> checkAnswers({
    required List<AnswerItemModel> answers,
    required String token,
  });
}
