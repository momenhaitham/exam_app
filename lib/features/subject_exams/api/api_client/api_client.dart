import 'package:exam_app_project/core/app_endpoints.dart';
import 'package:exam_app_project/features/subject_exams/data/models/subject_exams_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
part 'api_client.g.dart';


@injectable
@RestApi()
abstract class GetSubjectExamsAPIClient {
  @factoryMethod
  factory GetSubjectExamsAPIClient(Dio dio) = _GetSubjectExamsAPIClient;
  @GET(AppEndpoints.subjectExams)
  Future<SubjectExamsDto> getSubjectExams(@Query("subject") String subjectId);
}