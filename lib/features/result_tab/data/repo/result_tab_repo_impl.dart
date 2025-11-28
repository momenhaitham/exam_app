import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/result_tab/data/data_sources/offline/result_tab_data_source_contract.dart';
import 'package:exam_app_project/features/result_tab/data/repo/result_tab_repo_contract.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ResultTabRepoContract)
class ResultTabRepoImpl extends ResultTabRepoContract{
  ResultTabDataSourceContract resultTabDataSourceContract;
  ResultTabRepoImpl(this.resultTabDataSourceContract);

  @override
  Future<BaseResponse<List<ExamInfoModel>>> getSavedExams() async{
    return await resultTabDataSourceContract.getSavedExams();
  }
}