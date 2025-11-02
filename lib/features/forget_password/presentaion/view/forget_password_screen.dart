import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

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
