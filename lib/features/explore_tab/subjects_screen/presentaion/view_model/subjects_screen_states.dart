import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_model.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_response_model.dart';

class SubjectsScreenStates {
  BaseState<SubjectsResponseModel>? SubjectsScreenState;
  SubjectsScreenStates({this.SubjectsScreenState});

  SubjectsScreenStates copyWith({BaseState<SubjectsResponseModel>? SubjectsScreenStateParam}){
    return SubjectsScreenStates(SubjectsScreenState: SubjectsScreenStateParam??this.SubjectsScreenState);
  }
}