import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_theme.dart';
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
        initialRoute: AppRoutes.LoginScreenRoute,
        routes: {
          AppRoutes.LoginScreenRoute : (context)=>LoginScreen(),
        },
      ),
    );
  }
}
