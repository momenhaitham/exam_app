import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/data/models/subjects_response.dart';


abstract class GetallSubjectsRemoteDataSourceContract {
  Future<BaseResponse<SubjectsResponse>> GetAllSubjects(String? tokin);
}