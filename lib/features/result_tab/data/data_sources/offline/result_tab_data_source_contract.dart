import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';

abstract class ResultTabDataSourceContract {
  Future<BaseResponse<List<ExamInfoModel>>> getSavedExams(); 
}