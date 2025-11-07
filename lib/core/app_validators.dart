import 'package:exam_app_project/core/app_strings.dart';

class AppValidators {
  static String? ValidatePassword(String? value){
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
  }


  static String? ValidateEmail(String? value){
    if (value == null || value.isEmpty) {
                  return AppStrings.youMustEnterYourEmail;
                }
                final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                ).hasMatch(value);
                if (!emailValid) {
                  return AppStrings.NotValidEmail;
                }else 
                return null;
  }
}