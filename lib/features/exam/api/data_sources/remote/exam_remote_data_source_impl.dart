import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/exam/api/api_client/api_client.dart';
import 'package:exam_app_project/features/exam/data/data_sources/remote/exam_reomote_data_source_contract.dart';
import 'package:exam_app_project/features/exam/data/models/question_dto.dart';
import 'package:exam_app_project/features/exam/data/models/questions_response.dart';
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
}
