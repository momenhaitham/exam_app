import 'package:exam_app_project/config/base_response/base_response.dart';
import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/forget_password/domain/models/forget_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/models/reset_password_model.dart';
import 'package:exam_app_project/features/forget_password/domain/models/virefy_reset_code_model.dart';
import 'package:exam_app_project/features/forget_password/domain/use_cases/Virefy_reset_code_usecase.dart';
import 'package:exam_app_project/features/forget_password/domain/use_cases/forget_password_usecase.dart';
import 'package:exam_app_project/features/forget_password/domain/use_cases/reset_password_usecase.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_events.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates>{
  ForgetPasswordViewModel(this._forgetPassword,this._resetPassword,this._virefyResetCode):super(ForgetPasswordStates());
  ForgetPasswordUsecase _forgetPassword;
  VirefyResetCodeUsecase _virefyResetCode;
  ResetPasswordUsecase _resetPassword;
  String? EmailForNavigating;
  
  void DoIntent(ForgetPasswordEvents event,{String email="",String code="",String newPassword=""}){
    switch(event){
    
      case ForgetPasswordEvent():
        _ForgetPassword(email);
      case VirefyCodeEvent():
        _VirefyResetCode(code);
      case ResetPasswordEvent():
        _ResetPassword(newPassword: newPassword,email: email);
    }

  }


  void _ForgetPassword(String email)async{
    emit(state.copyWith(forgetPasswordStateParam:BaseState<ForgetPasswordModel>(isLoading: true)));
    BaseResponse<ForgetPasswordModel> ForgetPasswordResponse =await _forgetPassword.call(email);

    switch(ForgetPasswordResponse){
      case SuccessResponse<ForgetPasswordModel>():
        emit(state.copyWith(forgetPasswordStateParam: BaseState<ForgetPasswordModel>(data: ForgetPasswordResponse.data,isLoading: false)));
      case ErrorResponse<ForgetPasswordModel>():
        String errorMassege = ForgetPasswordResponse.error.toString();
        emit(state.copyWith(forgetPasswordStateParam: BaseState<ForgetPasswordModel>(errorMessage: errorMassege ,isLoading: false)));
    }
  }

  void _VirefyResetCode(String code)async{
    emit(state.copyWith(forgetPasswordStateParam:BaseState<VirefyResetCodeModel>(isLoading: true)));
    BaseResponse<VirefyResetCodeModel> VirefyResetCodeResponse =await _virefyResetCode.call(code);

    switch(VirefyResetCodeResponse){
      case SuccessResponse<VirefyResetCodeModel>():
        emit(state.copyWith(forgetPasswordStateParam: BaseState<VirefyResetCodeModel>(data: VirefyResetCodeResponse.data,isLoading: false)));
      case ErrorResponse<VirefyResetCodeModel>():
        String errorMassege = VirefyResetCodeResponse.error.toString();
        emit(state.copyWith(forgetPasswordStateParam: BaseState<VirefyResetCodeModel>(errorMessage: errorMassege ,isLoading: false)));
    }
  }


//FUCKING problem here in this function 
  void _ResetPassword({required String newPassword,required String email})async{
    emit(state.copyWith(forgetPasswordStateParam:BaseState<ResetPasswordModel>(isLoading: true)));
    BaseResponse<ResetPasswordModel> ResetPasswordResponse =await _resetPassword.call(newPassword: newPassword,email: email);

    switch(ResetPasswordResponse){
      case SuccessResponse<ResetPasswordModel>():
        emit(state.copyWith(forgetPasswordStateParam: BaseState<ResetPasswordModel>(data: ResetPasswordResponse.data,isLoading: false,errorMessage: null)));
      case ErrorResponse<ResetPasswordModel>():
        String errorMassege = ResetPasswordResponse.error.toString();
        emit(state.copyWith(forgetPasswordStateParam: BaseState<ResetPasswordModel>(errorMessage: errorMassege ,isLoading: false,data: null)));
    }
  }
}