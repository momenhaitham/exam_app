import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/login_states.dart';
import 'package:exam_app_project/features/login/presentaion/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget{
  LoginViewModel loginViewModel = getIt<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    var validate=GlobalKey<FormState>();
    String? email;
    return BlocProvider<LoginViewModel>(
      create: (context) => loginViewModel,
      child: BlocConsumer<LoginViewModel,LoginStates>(builder: (context, state) {
        return Scaffold(
        body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60.h),
            Text(AppStrings.login,style: AppStyles.normal20Black,),
            SizedBox(height: 24.h,),
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
                      if(value==null||value.isEmpty){
                        return AppStrings.youMustEnterYourEmail;
                      }
                      final bool emailValid =
                      RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);       
                      if(emailValid==false)
                      {
                        return AppStrings.NotValidEmail;
                      }
                    },
                    onChanged: (value) {
                      email=value;
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
                      email=value;
                    },
                  ),
                  SizedBox(height:2.h,),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {
                        return null;
                      },),
                      Text(AppStrings.RememberMe,style: AppStyles.ragular16Black,),
                      Spacer(),
                      InkWell(child: Text(AppStrings.ForgetPass,style: AppStyles.ragular16Black,),)
                    ],
                  ),
                  SizedBox(height:48.h,),
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: Text(AppStrings.login,style: AppStyles.Medium16White,),
                      style: ElevatedButton.styleFrom(backgroundColor:AppColors.blue )),
                  )
                ],
              ),
            )
          ],
          
        ),
      ),);
    },
    listener: (context, state) {
      
        
    },)) ;
  }
}