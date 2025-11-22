import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/api/api_client/api_client.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/data/data_sources/get_exam_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/data/models/exam_dto.dart';
import 'package:injectable/injectable.dart';

@Injectable(as : GetExamDataSourceContrcat)
class GetExamDataSourceImpl implements GetExamDataSourceContrcat {
  GetExamApiClient startExamApiClient;
  GetExamDataSourceImpl(this.startExamApiClient);
  @override
  Future<BaseResponse<ExamDto>> startExam(String examId,String? token) async{
    try{
      final response = await startExamApiClient.startExam(examId,"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY4ZmZjMGM3OGZiMTlhZDk1NWIyNDRlNSIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYzNzQ4MTQyfQ.DK-LBStVzRhn17pDud1ytQ39emijnfnano-86PHglMQ");
      return SuccessResponse<ExamDto>(data: response); 
    }catch (e){
      return ErrorResponse<ExamDto>(error: e as Exception);
    }
  }
}