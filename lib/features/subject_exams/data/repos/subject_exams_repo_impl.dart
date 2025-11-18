import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/subject_exams/data/data_sources/subject_exams_data_source_contract.dart';
import 'package:exam_app_project/features/subject_exams/data/models/subject_exams_dto.dart';
import 'package:exam_app_project/features/subject_exams/domain/models/subject_exmas_model.dart';
import 'package:exam_app_project/features/subject_exams/domain/repos/subject_exams_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: SubjectExamsRepoContract)
class SubjectExamsRepoImpl implements SubjectExamsRepoContract {
  SubjectExamsDataSourceContract dataSource;
  SubjectExamsRepoImpl(this.dataSource);
  @override
  Future<BaseResponse<SubjectExmasModel>> getSubjectExams(String subject)async {
    try {
      BaseResponse<SubjectExamsDto> dataResponse = await dataSource.getSubjectExams(subject);
      switch (dataResponse) {
  case SuccessResponse<SubjectExamsDto>():
    return SuccessResponse<SubjectExmasModel>(data: dataResponse.data.toModel());

  case ErrorResponse<SubjectExamsDto>():
    final error = dataResponse.error;
    return ErrorResponse<SubjectExmasModel>(error: error);
}} catch (e) {
      return ErrorResponse<SubjectExmasModel>(error: e as Exception);
    }
  }
}