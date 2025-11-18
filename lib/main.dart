import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/config/app_provider/app_provider.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_theme.dart';
import 'package:exam_app_project/features/exam/presentaion/views/screens/exam_screen.dart';
import 'package:exam_app_project/features/forget_password/presentaion/views/email_verfication_screen.dart';
import 'package:exam_app_project/features/forget_password/presentaion/views/forget_password_screen.dart';
import 'package:exam_app_project/features/forget_password/presentaion/views/reset_password_screen.dart';
import 'package:exam_app_project/features/home_screen/presentaion/views/home_screen.dart';
import 'package:exam_app_project/features/login/presentaion/views/login_screen.dart';
import 'package:exam_app_project/features/signup/presentation/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main()async {
  configureDependencies();  

  runApp(ChangeNotifierProvider(
    create: (context)=> AppProvider(),
    child: MyApp(),
   )
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AppProvider provider;

  
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppProvider>(context);
    
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.Theme,
        initialRoute:provider.token!=null?AppRoutes.HomeScreenRoute:AppRoutes.LoginScreenRoute,
        routes: {
          AppRoutes.LoginScreenRoute : (context)=>LoginScreen(),
          AppRoutes.signupScreenRoute : (context)=>SignupScreen(),
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