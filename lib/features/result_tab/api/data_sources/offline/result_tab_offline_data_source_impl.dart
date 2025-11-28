
import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/result_tab/data/data_sources/offline/result_tab_data_source_contract.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ResultTabDataSourceContract)
class ResultTabOfflineDataSourceImpl extends ResultTabDataSourceContract{
  @override
  Future<BaseResponse<List<ExamInfoModel>>> getSavedExams()async {
    var box =await Hive.openBox<ExamInfoModel>("exams1");
    try{
      List<ExamInfoModel> exams = box.values.toList();
      return SuccessResponse<List<ExamInfoModel>>(data: exams);
    }catch(e){
      return ErrorResponse(error: e as Exception);
    }
    
  }
}