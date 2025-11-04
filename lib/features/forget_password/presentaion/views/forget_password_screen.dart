import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_errors.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_events.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_states.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordViewModel forgetPasswordViewModel = getIt<ForgetPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    var validate=GlobalKey<FormState>();
    return BlocProvider<ForgetPasswordViewModel>(create:(context) => forgetPasswordViewModel,
    child: BlocConsumer<ForgetPasswordViewModel,ForgetPasswordStates>(
      builder: (context, state) {
      return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Text(AppStrings.password, style: AppStyles.normal20Black),
            SizedBox(height: 50.h),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.ForgetPass,
                    style: AppStyles.normal20Black,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Please enter your email associated to your account',
                    style: AppStyles.ragular16Gray,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Form(child: Column(
              children: [
                TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.EnterYourEmail,
                labelText: AppStrings.email,
                labelStyle: AppStyles.ragular16Gray,
                alignLabelWithHint: true,
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppStrings.youMustEnterYourEmail;
                }
                final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value);
                if (!emailValid) {
                  return AppStrings.NotValidEmail;
                }else if(state.baseState?.errorMessage!=null){
                  return AppErrors.noAccountWithThisEmail;
                }
                return null;
              },
              onChanged: (value) {
                state.Email = value;
                forgetPasswordViewModel.EmailForNavigating=value;
              },
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  validate.currentState?.validate();
                  
                  forgetPasswordViewModel.DoIntent(ForgetPasswordEvent(),email: state.Email!);
                  
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.blue,
                ),
                child: Text(
                  AppStrings.Continue,
                  style: AppStyles.Medium16White,
                ),
              ),
            ),
              ],
            ),
            key: validate,
            )
            
          ],
          ),
      ),
    );
        
    },
      listener: (context, state) {
      if(state.baseState?.isLoading==true){
        ShowDialogUtils.ShowLoading(context);
      }else if (state.baseState?.errorMessage!=null){
        ShowDialogUtils.HideLoading(context);
        ShowDialogUtils.ShowMessage(context, Title: AppErrors.noAccountWithThisEmail);
      }else if (state.baseState?.data!=null){
        ShowDialogUtils.HideLoading(context);
        Navigator.of(context).pushNamed(AppRoutes.EmailVerificationScreenRoute,arguments:forgetPasswordViewModel.EmailForNavigating);
      }
    },
  ),
    
    
    );

  }
}
