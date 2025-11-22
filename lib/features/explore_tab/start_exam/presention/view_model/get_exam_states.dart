import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/start_exam/domain/model/get_exam_model.dart';

class GetExamStates {
  BaseState<GetExamModel>? getExamState;

  GetExamStates({this.getExamState});

  GetExamStates copyWith({BaseState<GetExamModel>? getExamStateParam}) {
    return GetExamStates(getExamState: getExamStateParam ?? this.getExamState);
  }
}