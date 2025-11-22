// features/exam/data/data_sources/remote/exam_reomote_data_source_contract.dart
import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_response_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_request_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/get_questions_models/question_dto.dart';

abstract class ExamReomoteDataSourceContract {
  Future<BaseResponse<List<QuestionDto>>> getQuestions({
    required String examId,
    required String token,
  });

  Future<BaseResponse<CheckAnswersResponseDto>> checkAnswers({
    required CheckAnswersRequestDto request,
    required String token,
  });
}
