import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_errors.dart';
import 'package:exam_app_project/core/app_routes.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_events.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_states.dart';
import 'package:exam_app_project/features/forget_password/presentaion/view_model/forget_password_view_model.dart';
import 'package:exam_app_project/reuseable_widgets/show_dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class EmailVerficationScreen extends StatelessWidget {
  ForgetPasswordViewModel forgetPasswordViewModel = getIt<ForgetPasswordViewModel>();
  @override
  Widget build(BuildContext context) {
    
    var validate=GlobalKey<FormState>();
    return BlocProvider<ForgetPasswordViewModel>(create: (context) => forgetPasswordViewModel,
    child:BlocConsumer<ForgetPasswordViewModel,ForgetPasswordStates>(
    builder:(context, state)
    {
      forgetPasswordViewModel.EmailForNavigating = ModalRoute.of(context)?.settings.arguments as String?;
      return Scaffold(body: Padding(
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
                      length: 6,
                      animationType: AnimationType.fade,
                      cursorColor: Colors.black,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(12.r),
                        fieldHeight: 60.h,
                        fieldWidth: 40.w,
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
                      onChanged: (value) {
                        state.Code=value;
                        if(state.Code?.length == 6){
                          forgetPasswordViewModel.DoIntent(VirefyCodeEvent(),code: state.Code!);
                        }
                      },
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
                        onTap: () {
                          forgetPasswordViewModel.DoIntent(ForgetPasswordEvent(),email: forgetPasswordViewModel.EmailForNavigating!);
                        },
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
    },

    listener: (context, state) {
      if(state.baseState?.isLoading==true){
        ShowDialogUtils.ShowLoading(context);
      }else if(state.baseState?.errorMessage!=null){
        ShowDialogUtils.HideLoading(context);
        ShowDialogUtils.ShowMessage(context, Title: AppErrors.wrongCode);
      }else if(state.baseState?.data!=null){
        ShowDialogUtils.HideLoading(context);
        Navigator.of(context).pushNamed(AppRoutes.ResetPasswordScreenRoute,arguments:forgetPasswordViewModel.EmailForNavigating);
      }
    },
   )
    
   );
  }
}
