import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.EnterYourPassword,
                labelText: AppStrings.NewPassword,
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
                }
                return null;
              },
              onChanged: (value) {},
            ),
            SizedBox(height: 25.h),

            TextFormField(
              decoration: InputDecoration(
                hintText: AppStrings.ConfirmPassword,
                labelText: AppStrings.ConfirmPassword,
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
                }
                return null;
              },
              onChanged: (value) {},
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: () {},
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
      ),
    );
  }
}
