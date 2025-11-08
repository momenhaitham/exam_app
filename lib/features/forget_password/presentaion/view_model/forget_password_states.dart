import 'package:exam_app_project/config/base_state/base_state.dart';

class ForgetPasswordStates<T> extends BaseState<T> {
  BaseState<T>? baseState;
  String? Email;
  String? Code;
  String? NewPassword;
  ForgetPasswordStates({this.baseState});

  ForgetPasswordStates copyWith({BaseState<T>? forgetPasswordStateParam}){
    return ForgetPasswordStates(baseState: forgetPasswordStateParam??this.baseState);
  }
}