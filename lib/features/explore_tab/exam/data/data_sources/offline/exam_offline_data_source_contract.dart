import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';

abstract class ExamOfflineDataSourceContract {
  Future<void> saveExamInfo({required ExamInfoModel examInfoModel}) ;
}