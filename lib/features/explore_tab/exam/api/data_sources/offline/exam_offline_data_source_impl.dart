import 'package:exam_app_project/features/explore_tab/exam/data/data_sources/offline/exam_offline_data_source_contract.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ExamOfflineDataSourceContract)
class ExamOfflineDataSourceImpl extends ExamOfflineDataSourceContract{
  @override
  Future<void> saveExamInfo({required ExamInfoModel examInfoModel})async {
    var box = await Hive.openBox<ExamInfoModel>('exams1');
    await box.add(examInfoModel);
    box.close();
    print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> exam saved");
  }
}