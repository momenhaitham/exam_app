import 'dart:math';
import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/signup_validation.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/signup_events.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/signup_states.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/signup_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/custm_elevated_button.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  SignupViewModel signupViewModel = getIt<SignupViewModel>();

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return BlocProvider<SignupViewModel>(
      create: (context) => signupViewModel,
      child: BlocConsumer<SignupViewModel, SignupStates>(
        builder: (context, state) {
          return Scaffold(
          appBar: _buildAppBar(context),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    _buildCustomTextField(
                      label: AppStrings.username,
                      hint: AppStrings.enterYourUserName,
                      controller: signupViewModel.usernameController,
                      validator: (value) {
                        return SignupValidation.validateUserName(value);
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: _buildCustomTextField(
                            label: AppStrings.firstName,
                            hint: AppStrings.enterYourFirstName,
                            controller: signupViewModel.firstNameController,
                          ),
                        ),
                        SizedBox(width: 16.h),
                        Expanded(
                          child: _buildCustomTextField(
                            label: AppStrings.lastName,
                            hint: AppStrings.enterYourLastName,
                            controller: signupViewModel.lastNameController,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    _buildCustomTextField(
                      label: AppStrings.email,
                      hint: AppStrings.EnterYourEmail,
                      controller: signupViewModel.emailController,
                      validator: (value) {
                        return SignupValidation.emailValidator(value);
                      },
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      children: [
                        Expanded(
                          child: _buildCustomTextField(
                            label: AppStrings.password,
                            hint: AppStrings.EnterYourPassword,
                            controller: signupViewModel.passwordController,
                          ),
                        ),
                        SizedBox(width: 16.h),
                        Expanded(
                          child: _buildCustomTextField(
                            label: AppStrings.confirmPassword,
                            hint: AppStrings.EnterYourPassword,
                            controller: signupViewModel.confirmPasswordController,
                            validator: (value) {
                              return SignupValidation.validatePasswordMatch(
                                signupViewModel.passwordController.text,
                                value!,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    _buildCustomTextField(
                      label: AppStrings.phoneNumber,
                      hint: AppStrings.enterYourPhoneNumber,
                      controller: signupViewModel.phoneController,
                    ),
                    SizedBox(height: 40.h),
                    Row(
                      children: [
                        Expanded(
                          child: CustmElevatedButton(
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                signupViewModel.DoIntent(
                                  SignupEvent(),
                                  username:
                                      signupViewModel.usernameController.text,
                                  firstName:
                                      signupViewModel.firstNameController.text,
                                  lastName:
                                      signupViewModel.lastNameController.text,
                                  email: signupViewModel.emailController.text,
                                  password:
                                      signupViewModel.passwordController.text,
                                  rePassword: signupViewModel
                                      .confirmPasswordController
                                      .text,
                                  phone: signupViewModel.phoneController.text,
                                );
                              }
                            },
                            BGcolor: AppColors.blue,
                            text: AppStrings.signup,
                            styleOfChild: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppStrings.alreadyHaveAnAccount,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.black,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.LoginScreenRoute,
                            );
                          },
                          child: Text(
                            AppStrings.login,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              decorationThickness: 2,
                              decorationColor: AppColors.blue,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      
        }, listener: (context, state) {
      if(state.signupState?.isLoading==true){
        ShowDialog.showLoading(context);
      }else if (state.signupState?.errorMessage!=null){
        ShowDialog.hideLoading(context);
        ShowDialog.showMessage(context, Title: state.signupState?.errorMessage);
      }else if (state.signupState?.data!=null){
        ShowDialog.hideLoading(context);
        ShowDialog.showMessage(context, Title: state.signupState?.data?.message);
      }
        
    },
),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        AppStrings.signupAppBarTitle,
        style: TextStyle(
          fontSize: 20.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: AppColors.black, size: 20.sp),
        onPressed: () =>
            Navigator.pushReplacementNamed(context, AppRoutes.LoginScreenRoute),
      ),
    );
  }

  Widget _buildCustomTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
    );
  }
}
