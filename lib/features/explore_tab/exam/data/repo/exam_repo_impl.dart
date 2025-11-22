import 'dart:developer';

import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/data_sources/remote/exam_reomote_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/answer_item_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_request_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_response_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/get_questions_models/question_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/answer_item_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/check_answers_result_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/question_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/repo/exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ExamRepoContract)
class ExamRepoImpl implements ExamRepoContract {
  ExamRepoImpl({required this.examRemoteDataSource});
  ExamReomoteDataSourceContract examRemoteDataSource;

  @override
  Future<BaseResponse<List<QuestionModel>>> getQuestions({
    required String examId,
    required String token,
  }) async {
    BaseResponse<List<QuestionDto>> questionsResponse =
        await examRemoteDataSource.getQuestions(examId: examId, token: token);
    switch (questionsResponse) {
      case SuccessResponse<List<QuestionDto>>():
        List<QuestionDto> questions = questionsResponse.data;
        List<QuestionModel> questionModels = questions
            .map((questionDto) => questionDto.toDomain())
            .toList();
        return SuccessResponse<List<QuestionModel>>(data: questionModels);
      case ErrorResponse<List<QuestionDto>>():
        return ErrorResponse<List<QuestionModel>>(
          error: questionsResponse.error,
        );
    }
  }

  @override
  Future<BaseResponse<CheckAnswersResultModel>> checkAnswers({
    required List<AnswerItemModel> answers,
    required String token,
  }) async {
    log('ExamRepoImpl - Received ${answers.length} answers');

    final requestDto = CheckAnswersRequestDto(
      answers: answers
          .map((answer) => AnswerItemDto.fromDomain(answer))
          .toList(),
    );

    BaseResponse<CheckAnswersResponseDto> checkAnswersResponse =
        await examRemoteDataSource.checkAnswers(
          request: requestDto,
          token: token,
        );

    switch (checkAnswersResponse) {
      case SuccessResponse<CheckAnswersResponseDto>():
        CheckAnswersResponseDto responseDto = checkAnswersResponse.data;
        CheckAnswersResultModel resultModel = responseDto.toDomain();
        return SuccessResponse<CheckAnswersResultModel>(data: resultModel);
      case ErrorResponse<CheckAnswersResponseDto>():
        return ErrorResponse<CheckAnswersResultModel>(
          error: checkAnswersResponse.error,
        );
    }
  }
}
