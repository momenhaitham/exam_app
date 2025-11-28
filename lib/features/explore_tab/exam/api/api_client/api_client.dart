import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_request_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/check_answers_response_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/get_questions_models/questions_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
@injectable
abstract class ExamApiClient {
  @factoryMethod
  factory ExamApiClient(Dio dio) = _ExamApiClient;

  @GET(AppEndpoints.getQuestionsEndpoint)
  Future<QuestionResponse> getQuestions(
    @Query('exam') String examId,
    @Header('token') String token,
  );
  @POST(AppEndpoints.checkAnswersEndpoint)
  Future<CheckAnswersResponseDto> checkAnswers(
    @Body() CheckAnswersRequestDto request,
    @Header('token') String token,
  );
}
