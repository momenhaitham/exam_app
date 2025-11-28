import 'package:exam_app_project/config/app_provider/app_provider.dart';
import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_model.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_response_model.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/use_cases/getall_subjects_usecase.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_events.dart';
import 'package:exam_app_project/features/explore_tab/subjects_screen/presentaion/view_model/subjects_screen_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class SubjectsScreenViewmodel extends Cubit<SubjectsScreenStates>{
  SubjectsScreenViewmodel(this._getallSubjectsUsecase):super(SubjectsScreenStates());
  GetallSubjectsUsecase _getallSubjectsUsecase;
  String search ="";
  int filteredListItemCount = 0;
  List<SubjectsModel>? filteredSubjects;

  void doIntent(SubjectsScreenEvents event,{String? tokin,String? searchValue,SubjectsResponseModel? subjectsResponse,BuildContext? context}){
    switch(event) {
      
      case GetallSubjectsEvent():
      var provider = Provider.of<AppProvider>(context!);
      _getAllSubjects(provider.token);
        
      case SearchForSubjectEvent():
      _searchForSubject(searchValue,subjectsResponse);
      //case CalculateFilterdListItemCountEvent():
      //_calculateFilteredList(subjectsResponse);
    }

  }

  void _getAllSubjects(String? tokin)async{
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

  void _searchForSubject(String? value,SubjectsResponseModel? subjectsResponse){
    emit(state.copyWith(SubjectsScreenStateParam:BaseState<SubjectsResponseModel>(isLoading: true,)));
    search=value??"";
    filteredSubjects=[];
    if(search.isNotEmpty){
    for(int i = 0 ;i<=subjectsResponse!.SubjectsModelsList!.length-1 ;i++){
      if(subjectsResponse.SubjectsModelsList![i].name!.toLowerCase().contains(search.toLowerCase())){
        filteredSubjects!.add(subjectsResponse.SubjectsModelsList![i]);
      }
    }
    }
    emit(state.copyWith(SubjectsScreenStateParam: BaseState<SubjectsResponseModel>(isLoading: false,data: subjectsResponse)),);
  }
}