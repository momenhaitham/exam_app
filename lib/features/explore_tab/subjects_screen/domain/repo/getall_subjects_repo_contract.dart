import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_response_model.dart';


abstract class GetallSubjectsRepoContract {
  Future<BaseResponse<SubjectsResponseModel>> GetAllSubjects(String? tokin);
}