import 'dart:developer';

import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/exam/api/api_client/api_client.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/data_sources/remote/exam_reomote_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_request_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_response_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/get_questions_models/question_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/get_questions_models/questions_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamReomoteDataSourceContract)
class ExamRemoteDataSourceImpl implements ExamReomoteDataSourceContract {
  final ExamApiClient apiClient;

  ExamRemoteDataSourceImpl(this.apiClient);

  @override
  Future<BaseResponse<List<QuestionDto>>> getQuestions({
    required String examId,
    required String token,
  }) async {
    try {
      final QuestionResponse questionResponse = await apiClient.getQuestions(
        examId,
        token,
      );
      final List<QuestionDto> questions = questionResponse.questions ?? [];
      return SuccessResponse<List<QuestionDto>>(data: questions);
    } catch (e) {
      return ErrorResponse<List<QuestionDto>>(error: e as Exception);
    }
  }

  @override
  Future<BaseResponse<CheckAnswersResponseDto>> checkAnswers({
    required CheckAnswersRequestDto request,
    required String token,
  }) async {
    log(request.toString());
    try {
      final CheckAnswersResponseDto response = await apiClient.checkAnswers(
        request,
        token,
      );
      return SuccessResponse<CheckAnswersResponseDto>(data: response);
    } catch (e) {
      return ErrorResponse<CheckAnswersResponseDto>(
        error: e is Exception ? e : Exception(e.toString()),
      );
    }
  }


  
}
