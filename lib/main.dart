import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_theme.dart';
import 'package:exam_app_project/features/exam/presentaion/views/screens/exam_screen.dart';
import 'package:exam_app_project/features/forget_password/presentaion/views/email_verfication_screen.dart';
import 'package:exam_app_project/features/forget_password/presentaion/views/forget_password_screen.dart';
import 'package:exam_app_project/features/forget_password/presentaion/views/reset_password_screen.dart';
import 'package:exam_app_project/features/home_screen/presentaion/views/home_screen.dart';
import 'package:exam_app_project/features/login/presentaion/views/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        theme: AppTheme.Theme,
        initialRoute: AppRoutes.examScreenRoute,
        routes: {
          AppRoutes.LoginScreenRoute: (context) => LoginScreen(),
          AppRoutes.ForgetPasswordScreenRoute: (context) =>
              ForgetPasswordScreen(),
          AppRoutes.EmailVerificationScreenRoute: (context) =>
              EmailVerficationScreen(),
          AppRoutes.ResetPasswordScreenRoute: (context) =>
              ResetPasswordScreen(),
          AppRoutes.HomeScreenRoute: (context) => HomeScreen(),
          AppRoutes.examScreenRoute: (context) => ExamScreen(),
        },
      ),
    );
  }
}
