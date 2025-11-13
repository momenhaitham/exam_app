// features/exam/data/data_sources/exam_api_client.dart
import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/features/exam/data/models/questions_response.dart';
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
}
