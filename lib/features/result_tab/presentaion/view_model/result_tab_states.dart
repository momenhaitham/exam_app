import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';

class ResultTabStates {
  BaseState<List<ExamInfoModel>>? resultTabState;
  ResultTabStates({this.resultTabState});

  ResultTabStates copyWith({BaseState<List<ExamInfoModel>>? resultTabStateParam}){
    return ResultTabStates(resultTabState: resultTabStateParam??this.resultTabState);
  } 
}