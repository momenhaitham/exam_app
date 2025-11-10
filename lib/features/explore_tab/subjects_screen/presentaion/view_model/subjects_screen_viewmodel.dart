import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_response_model.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/use_cases/getall_subjects_usecase.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_events.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubjectsScreenViewmodel extends Cubit<SubjectsScreenStates>{
  SubjectsScreenViewmodel(this._getallSubjectsUsecase):super(SubjectsScreenStates());
  GetallSubjectsUsecase _getallSubjectsUsecase;


  void DoIntent(SubjectsScreenEvents event,{String? tokin}){
    switch(event) {
      
      case GetallSubjectsEvent():
      _GetAllSubjects(tokin);
        
    }

  }

  void _GetAllSubjects(String? tokin)async{
    emit(state.copyWith(SubjectsScreenStateParam: BaseState<SubjectsResponseModel>(isLoading: true)));
    BaseResponse<SubjectsResponseModel> response = await _getallSubjectsUsecase.call(tokin);
    switch(response){
      
      case SuccessResponse<SubjectsResponseModel>():
        emit(state.copyWith(SubjectsScreenStateParam: BaseState<SubjectsResponseModel>(isLoading: false,data: response.data)),
        );

      case ErrorResponse<SubjectsResponseModel>():
        emit(state.copyWith(SubjectsScreenStateParam: BaseState<SubjectsResponseModel>(isLoading: false,errorMessage: response.error.toString())));
    }
  }
}