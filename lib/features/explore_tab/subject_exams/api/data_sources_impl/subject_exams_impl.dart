import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/api/api_client/api_client.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/data/data_sources/subject_exams_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/data/models/subject_exams_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:SubjectExamsDataSourceContract)
class SubjectExamsImpl implements SubjectExamsDataSourceContract {
  final GetSubjectExamsAPIClient apiClient;

  SubjectExamsImpl(this.apiClient);
  @override
  Future<BaseResponse<SubjectExamsDto>> getSubjectExams(String? subject,String? token) async {
    try{
      SubjectExamsDto examsResponse = await apiClient.getSubjectExams(subject,token);
      return SuccessResponse<SubjectExamsDto>(data: examsResponse);
    }catch(e){
      return ErrorResponse<SubjectExamsDto>(error: e as Exception);
    }
  }
  
  @override
  Future<BaseResponse<SubjectExamsDto>> getAllExams(String? token)async {
    try{
      SubjectExamsDto examsResponse = await apiClient.getAllExams(token);
      return SuccessResponse<SubjectExamsDto>(data: examsResponse);
    }catch(e){
      return ErrorResponse<SubjectExamsDto>(error: e as Exception);
    }
  }
}