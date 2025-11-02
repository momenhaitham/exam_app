import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/login/domain/models/signup_model.dart';

class SignupStates {
  BaseState<SignupModel>? signupState;

  SignupStates({this.signupState});
  
  SignupStates copyWith({BaseState<SignupModel>? signupStateParam}){
    return SignupStates(signupState: signupStateParam??this.signupState);
  }
}