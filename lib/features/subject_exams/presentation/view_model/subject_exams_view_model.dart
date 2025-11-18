import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/subject_exams/domain/models/subject_exmas_model.dart';
import 'package:exam_app_project/features/subject_exams/domain/use_cases/get_subject_exams_usecase.dart';
import 'package:exam_app_project/features/subject_exams/presentation/view_model/subject_exams_events.dart';
import 'package:exam_app_project/features/subject_exams/presentation/view_model/subject_exams_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectExamsViewModel extends Cubit<SubjectExamsStates> {
  GetSubjectExamsUsecase _getSubjectExamsUsecase;
  SubjectExamsViewModel(this._getSubjectExamsUsecase)
      : super(SubjectExamsStates());

  Future<BaseResponse<SubjectExmasModel>> DoIntent(SubjectExamsEvents  events,String subjectId) {
    return _getSubjectExams(subjectId);
  }
  
  Future<BaseResponse<SubjectExmasModel>> _getSubjectExams(String subjectId) async {
    emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(isLoading: true )));
    BaseResponse<SubjectExmasModel> getSubjectExamsResponse = await _getSubjectExamsUsecase.getSubjectExams(subjectId);
    switch(getSubjectExamsResponse){
      case SuccessResponse<SubjectExmasModel>():
        emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(data: getSubjectExamsResponse.data,isLoading: false )));
      case ErrorResponse<SubjectExmasModel>():
        String errorMassege = getSubjectExamsResponse.error.toString();
        emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(errorMessage: errorMassege ,isLoading: false )));
      case SuccessResponse<List<SubjectExmasModel>>():
    }
    return getSubjectExamsResponse;
  }
}