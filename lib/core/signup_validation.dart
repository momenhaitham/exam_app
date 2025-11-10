import 'package:exam_app_project/core/app_strings.dart';

class SignupValidation {
  static String? validateUserName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppStrings.notValidUserName;
    }
    return null;
  }

  static String? validatePasswordMatch(String password, String rePassword) {
    if (
        password.trim().isEmpty || rePassword.trim().isEmpty || password != rePassword) {
      return AppStrings.passwordNotMatched;
    }
    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.youMustEnterYourEmail;
    }
    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return AppStrings.NotValidEmail;
    }
    return null;
  }

}