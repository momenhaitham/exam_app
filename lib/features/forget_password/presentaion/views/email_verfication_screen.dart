import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerficationScreen extends StatelessWidget {
  const EmailVerficationScreen({super.key});

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
                    AppStrings.emailVerification,
                    style: AppStyles.normal20Black,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Please enter your code that send to your email address',
                    style: AppStyles.ragular16Gray,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),

                  // 🔹 OTP Input
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 4,
                      animationType: AnimationType.fade,
                      cursorColor: Colors.black,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12.r),
                        fieldHeight: 60.h,
                        fieldWidth: 65.w,
                        activeFillColor: const Color(0xFFE8EDFB),
                        inactiveFillColor: const Color(0xFFE8EDFB),
                        selectedFillColor: const Color(0xFFE8EDFB),
                        activeColor: Colors.transparent,
                        inactiveColor: Colors.transparent,
                        selectedColor: Colors.transparent,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (value) {},
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // 🔹 Resend Text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't receive code? ",
                        style: AppStyles.ragular16Black,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Resend",

                          style: AppStyles.ragular16Gray.copyWith(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
