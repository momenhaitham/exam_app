import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/start_exam/api/api_client/api_client.dart';
import 'package:exam_app_project/features/start_exam/data/data_sources/get_exam_data_source_contract.dart';
import 'package:exam_app_project/features/start_exam/data/models/exam_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : GetExamDataSourceContrcat)
class GetExamDataSourceImpl implements GetExamDataSourceContrcat {
  GetExamApiClient startExamApiClient;
  GetExamDataSourceImpl(this.startExamApiClient);
  @override
  Future<BaseResponse<ExamDto>> startExam(String examId) async{
    try{
      final response = await startExamApiClient.startExam(examId);
      return SuccessResponse<ExamDto>(data: response); 
    }catch (e){
      return ErrorResponse<ExamDto>(error: e as Exception);
    }
  }
}