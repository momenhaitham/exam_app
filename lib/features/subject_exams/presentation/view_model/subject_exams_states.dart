import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/subject_exams/domain/models/subject_exmas_model.dart';

class SubjectExamsStates {
  BaseState<SubjectExmasModel>? subjectExamsState;
  SubjectExamsStates({this.subjectExamsState});

  SubjectExamsStates copyWith({BaseState<SubjectExmasModel>? subjectExamsStateParam}){
    return SubjectExamsStates(subjectExamsState: subjectExamsStateParam??this.subjectExamsState);
  }
}