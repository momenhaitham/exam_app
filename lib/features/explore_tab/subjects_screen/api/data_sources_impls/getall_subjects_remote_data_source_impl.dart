import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/api/api_client/api_client.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/data/data_sources/getall_subjects_remote_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/data/models/subjects_response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:GetallSubjectsRemoteDataSourceContract)
class GetallSubjectsRemoteDataSourceImpl extends GetallSubjectsRemoteDataSourceContract{
  SubjectsApiClient apiClient;
  GetallSubjectsRemoteDataSourceImpl(this.apiClient);
  @override
  Future<BaseResponse<SubjectsResponse>> GetAllSubjects(String? tokin)async {

    try{
      SubjectsResponse response =await apiClient.GetAllSubjects("Bearer ${tokin}");
      return SuccessResponse<SubjectsResponse>(data: response);
    }catch(e){
      return ErrorResponse(error: e as Exception);
    }
  }
}