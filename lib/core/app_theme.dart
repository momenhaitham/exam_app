import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData Theme= ThemeData(
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2,color:Colors.black87),
        borderRadius:BorderRadius.circular(4),),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2,color:Colors.red),
        borderRadius: BorderRadius.circular(4),),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2,color:AppColors.black),
        borderRadius: BorderRadius.circular(4)),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2,color:Colors.red),
        borderRadius: BorderRadius.circular(4),)
      ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100))
        )
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
      selectedLabelStyle: AppStyles.Medium16Blue,
      unselectedLabelStyle: AppStyles.Medium16Gray,
    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: AppColors.white
    ),
    );
  
}