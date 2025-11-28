import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/model/get_exam_model.dart';

abstract class GetExamRepoContract {
  Future<BaseResponse<GetExamModel>> startExam(String examId,String? token);
}