import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/domain/models/subject_exmas_model.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/domain/use_cases/get_allexams_usecase.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/domain/use_cases/get_subject_exams_usecase.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/presentation/view_model/subject_exams_events.dart';
import 'package:exam_app_project/features/explore_tab/subject_exams/presentation/view_model/subject_exams_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectExamsViewModel extends Cubit<SubjectExamsStates> {
  GetSubjectExamsUsecase _getSubjectExamsUsecase;
  GetAllExamsUsecase _getAllExamsUsecase;
  SubjectExamsViewModel(this._getSubjectExamsUsecase,this._getAllExamsUsecase)
      : super(SubjectExamsStates());

  void DoIntent(SubjectExamsEvents  events, {String? subjectId,String? token}) {
    switch(events){
      
      case GetSubjectExamsEvent():
        _getSubjectExams(subjectId, token);
      case GetAllExamsEvent():
        _getAllExams(token);
    }
  }
  
  void _getSubjectExams(String? subjectId,String? tokin) async {
    emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(isLoading: true )));
    BaseResponse<SubjectExmasModel> getSubjectExamsResponse = await _getSubjectExamsUsecase.getSubjectExams(subjectId,tokin);
    switch(getSubjectExamsResponse){
      case SuccessResponse<SubjectExmasModel>():
        emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(data: getSubjectExamsResponse.data,isLoading: false )));
      case ErrorResponse<SubjectExmasModel>():
        String errorMassege = getSubjectExamsResponse.error.toString();
        emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(errorMessage: errorMassege ,isLoading: false )));
      case SuccessResponse<List<SubjectExmasModel>>():
    }
    
  }


  void _getAllExams(String? token) async {
    emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(isLoading: true )));
    BaseResponse<SubjectExmasModel> getAllExamsResponse = await _getAllExamsUsecase.getAllExams(token);
    switch(getAllExamsResponse){
      case SuccessResponse<SubjectExmasModel>():
        emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(data: getAllExamsResponse.data,isLoading: false )));
      case ErrorResponse<SubjectExmasModel>():
        String errorMassege = getAllExamsResponse.error.toString();
        emit(state.copyWith(subjectExamsStateParam: BaseState<SubjectExmasModel>(errorMessage: errorMassege ,isLoading: false )));

    }
    
  }
}