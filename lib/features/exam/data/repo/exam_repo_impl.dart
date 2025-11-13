import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/exam/data/data_sources/remote/exam_reomote_data_source_contract.dart';
import 'package:exam_app_project/features/exam/data/models/question_dto.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';
import 'package:exam_app_project/features/exam/domain/repo/exam_repo_contract.dart';
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
}
