import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/core/app_validators.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/login_events.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/login_states.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/login_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget{
  LoginViewModel loginViewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    var validate=GlobalKey<FormState>();
    
    return BlocProvider<LoginViewModel>(
      create: (context) => loginViewModel,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              const Text(AppStrings.login,style: AppStyles.normal20Black,),
              SizedBox(height: 24.h,),
              BlocConsumer<LoginViewModel,LoginStates>(builder: (context, state) {
                return 
                Form(
                  key: validate,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          enabled: true,
                          hint: Text(AppStrings.EnterYourEmail),
                          label: Text(AppStrings.email),
                          labelStyle: AppStyles.ragular16Gray,
                          alignLabelWithHint: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always
                         ),
                        validator: (value) {
                          return AppValidators.ValidateEmail(value);
                        },
                        onChanged: (value) {
                          loginViewModel.enteredEmail=value;
                        },
                      ),
                      SizedBox(height:24.h,),
                      TextFormField(
                        decoration: InputDecoration(
                          enabled: true,
                          hint: Text(AppStrings.EnterYourPassword),
                          label: Text(AppStrings.password),
                          labelStyle: AppStyles.ragular16Gray,
                          alignLabelWithHint: true,
                          floatingLabelBehavior: FloatingLabelBehavior.always
                         ),
                        validator: (value) {
                          return AppValidators.ValidatePassword(value);
                        },
                        onChanged: (value) {
                          loginViewModel.enteredPassword = value;
                        },
                      ),
                      SizedBox(height:2.h,),
                      Row(
                        children: [
                          Checkbox(value: loginViewModel.rememberMeChickBox==0?false:true, onChanged: (value) {
                          loginViewModel.DoIntent(RememberMeEvent(),RememberMeChickBoxValue: loginViewModel.rememberMeChickBox);
                          },),
                          Text(AppStrings.RememberMe,style: AppStyles.ragular16Black,),
                          Spacer(),
                          InkWell(child: Text(AppStrings.ForgetPass,style: AppStyles.ragular16Black.copyWith(decoration:TextDecoration.underline ),),
                          onTap: () {
                            Navigator.of(context).pushNamed(AppRoutes.LoginScreenRoute);
                          },
                          )
                        ],
                      ),
                      SizedBox(height:48.h,),
                      Container(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          onPressed: (){
                            if(validate.currentState?.validate()==true){
                            loginViewModel.DoIntent(LoginEvent(),email:loginViewModel.enteredEmail!,password:loginViewModel.enteredPassword! );
                            }
                          },
                          child: Text(AppStrings.login,style: AppStyles.Medium16White,),
                          style: ElevatedButton.styleFrom(backgroundColor:AppColors.blue )),
                      )
                    ],
                  ),
                );
                  },
                  listener: (context, state) {
              if(state.loginState?.isLoading==true){
                ShowDialogUtils.ShowLoading(context);
              }else if (state.loginState?.errorMessage!=null){
                ShowDialogUtils.HideLoading(context);
                ShowDialogUtils.ShowMessage(context, Title: state.loginState?.errorMessage);
              }else if (state.loginState?.data!=null){
                ShowDialogUtils.HideLoading(context);
                ShowDialogUtils.ShowMessage(context, Title: state.loginState?.data?.massage);
              }
                
                  },),
              SizedBox(height: 16.h,),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: AppStrings.dontHaveAnAccount,
                        style: AppStyles.ragular16Black,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 4), // small spacing between texts
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(AppRoutes.signupScreenRoute);
                  },
                  child: Text(
                    AppStrings.signUp,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: AppColors.blue,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          )

          ],
          ),
        ),
      )) ;
  }
}