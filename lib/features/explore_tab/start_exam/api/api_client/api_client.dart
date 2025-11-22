import 'package:dio/dio.dart';
import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/data/models/exam_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
part 'api_client.g.dart';

@injectable
@RestApi()
abstract class GetExamApiClient{
  @factoryMethod
  factory GetExamApiClient(Dio dio) => _GetExamApiClient(dio);

  @GET(AppEndpoints.exam)
  Future<ExamDto> startExam(@Path() String examId, @Header("token") String? token);

}