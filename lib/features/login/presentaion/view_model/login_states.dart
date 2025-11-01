import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/login/domain/models/login_model.dart';

class LoginStates {
  BaseState<LoginModel>? loginState;

  LoginStates({this.loginState});

  LoginStates copyWith({BaseState<LoginModel>? loginStateParam}){
    return LoginStates(loginState: loginStateParam??this.loginState);
  }

}