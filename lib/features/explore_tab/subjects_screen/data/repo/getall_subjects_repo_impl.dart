import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/data/data_sources/getall_subjects_remote_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/data/models/subjects_response.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_response_model.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/repo/getall_subjects_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetallSubjectsRepoContract)
class GetallSubjectsRepoImpl extends GetallSubjectsRepoContract {
  GetallSubjectsRemoteDataSourceContract subjectsRemoteDataSourceContract;
  GetallSubjectsRepoImpl(this.subjectsRemoteDataSourceContract);
  @override
  Future<BaseResponse<SubjectsResponseModel>> GetAllSubjects(String? tokin)async {
    BaseResponse<SubjectsResponse> response = await subjectsRemoteDataSourceContract.GetAllSubjects(tokin);
    switch(response){

      case SuccessResponse<SubjectsResponse>():
        var models = response.data.subjects?.map((e) {
          return e.ToModel();
        },).toList();
        SubjectsResponseModel subjectsResponseModel = SubjectsResponseModel(SubjectsModelsList: models,
        currentPage: response.data.metadata?.currentPage,
        limit: response.data.metadata?.limit,
        numberOfPages: response.data.metadata?.numberOfPages
        );
        return SuccessResponse<SubjectsResponseModel>(data: subjectsResponseModel);
      case ErrorResponse<SubjectsResponse>():
        return ErrorResponse(error: response.error);
    }
  }
}