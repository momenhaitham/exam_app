import 'package:exam_app_project/config/app_provider/app_provider.dart';
import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/login/domain/models/login_model.dart';
import 'package:exam_app_project/features/login/domain/use_cases/login_usecase.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/login_events.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:provider/provider.dart';

@injectable
class LoginViewModel extends Cubit<LoginStates>{
  LoginViewModel(this._login):super(LoginStates());
  LoginUsecase _login;
  String? enteredEmail;
  String? enteredPassword;
  int rememberMeChickBox = 0;

  void DoIntent(LoginEvents event,{String email = "",String password = "",int RememberMeChickBoxValue = 0}){
    switch (event){
      
      case LoginEvent():
        _Login(email, password);
      case RememberMeEvent():
        _RememberMeChickBox(RememberMeChickBoxValue);
    }
  }

  void _Login (String email,String password)async{
    emit(state.copyWith(loginStateParam: BaseState<LoginModel>(isLoading: true)));
    BaseResponse<LoginModel> loginResponse =await _login.call(email, password);

    switch(loginResponse){
      case SuccessResponse<LoginModel>():
        emit(state.copyWith(loginStateParam: BaseState<LoginModel>(data: loginResponse.data,isLoading: false)));
        
      case ErrorResponse<LoginModel>():
        String errorMassege = loginResponse.error.toString();
        emit(state.copyWith(loginStateParam: BaseState<LoginModel>(errorMessage: errorMassege ,isLoading: false)));
    }
  }

  void _RememberMeChickBox(int value){

    if(rememberMeChickBox==0){
      rememberMeChickBox=1;
    }else if (rememberMeChickBox == 1){
      rememberMeChickBox=0;
    }
    emit(state.copyWith());
  }





}