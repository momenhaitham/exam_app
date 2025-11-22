import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/data/data_sources/get_exam_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/data/models/exam_dto.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/model/get_exam_model.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/repo/get_exam_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetExamRepoContract)
class GetExamRepoImpl implements GetExamRepoContract {
  GetExamDataSourceContrcat getExamRepoContract;
  GetExamRepoImpl(this.getExamRepoContract);
  @override
  Future<BaseResponse<GetExamModel>> startExam(String examId,String? token) async {
    try{
      final response = await getExamRepoContract.startExam(examId,token);
      switch(response){
        case SuccessResponse<ExamDto>() : return SuccessResponse<GetExamModel>(data: response.data.toModel());
        case ErrorResponse<ExamDto>() : return ErrorResponse<GetExamModel>(error: response.error);
      }
    }catch (e){
      return ErrorResponse<GetExamModel>(error: e as Exception);
    }
  }
}