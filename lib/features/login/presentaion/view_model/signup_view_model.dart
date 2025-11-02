import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/login/domain/use_cases/signup_usecase.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/signup_events.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/signup_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupViewModel extends Cubit<SignupStates>{
  SignupUsecase _signup;

  TextEditingController usernameController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController phoneController = TextEditingController();

  SignupViewModel(this._signup):super(SignupStates());

  void DoIntent(SignupEvents event,{
    String username = "",
    String firstName = "",
    String lastName = "",
    String email = "",
    String password = "",
    String rePassword = "",
    String phone = "",
  }){
    switch (event){
      case SignupEvent():
        _signUp(username, firstName, lastName, email, password, rePassword, phone);
    }
  }

  void _signUp (String username , String firstName , String lastName , String email , String password , String rePassword , String phone)async{
    emit(state.copyWith(signupStateParam: BaseState(isLoading: true)));
    final signupResponse = await _signup.call(username, firstName, lastName, email, password, rePassword, phone);

    switch(signupResponse){
      case SuccessResponse():
        emit(state.copyWith(signupStateParam: BaseState(data: signupResponse.data,isLoading: false)));
      case ErrorResponse():
        String errorMassege = signupResponse.error.toString();
        emit(state.copyWith(signupStateParam: BaseState(errorMessage: errorMassege ,isLoading: false)));
    }
  }

}