import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_colors.dart';
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

class ResetPasswordScreen extends StatelessWidget {
  ForgetPasswordViewModel forgetPasswordViewModel = getIt<ForgetPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    var validate=GlobalKey<FormState>();
    return BlocProvider<ForgetPasswordViewModel>(create: (context) => forgetPasswordViewModel,
    child: BlocConsumer<ForgetPasswordViewModel,ForgetPasswordStates>(
      builder: (context, state) {
        forgetPasswordViewModel.EmailForNavigating = ModalRoute.of(context)?.settings.arguments as String?;
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
                    AppStrings.ResetPassword,
                    style: AppStyles.normal20Black,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Password must not be empty and must contain 6 characters with upper case letter and one number at least ',
                    style: AppStyles.ragular16Gray,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.h),
            Form(
              key:validate,
              child: Column(
              children: [
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
                  RegExp regex =RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value==null||value.isEmpty) {
                    return AppStrings.youMustEnterYourPassword;
                  } else {
                    if (!regex.hasMatch(value)) {
                    return AppStrings.NotValidPassword;
                    } else {
                      return null;
                    }
                 }
              },
              onChanged: (value) {
                state.NewPassword=value;
              },
            ),
            SizedBox(height: 25.h),
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
                  RegExp regex =RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                  if (value==null||value.isEmpty) {
                    return AppStrings.youMustEnterYourPassword;
                    } else if (!regex.hasMatch(value)) {
                    return AppStrings.NotValidPassword;
                    }else if (value != state.NewPassword){
                      return AppStrings.passwordDoesntMatch;
                    }
              },
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {
                  if(validate.currentState?.validate()==true){
                    forgetPasswordViewModel.DoIntent(ResetPasswordEvent(),email: forgetPasswordViewModel.EmailForNavigating!,newPassword: state.NewPassword!);
                  }
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
              ))
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
        }else if (state.baseState?.data!=null ){
        ShowDialogUtils.HideLoading(context);
        ShowDialogUtils.ShowMessage(context, Title: AppStrings.passwordSuccessfulyChanged,PosActionName: "ok",PosAction: (){
          Navigator.popUntil(context, (route){return route.settings.name==AppRoutes.LoginScreenRoute;});
        });

        }
      },),
    );
    
  }
}
