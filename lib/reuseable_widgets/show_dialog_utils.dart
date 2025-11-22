import 'package:exam_app_project/core/app_assets.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/reuseable_widgets/custm_elevated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowDialogUtils {
  static void ShowLoading(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Loading", style: AppStyles.normal20Black),
          content: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.0),
            child: CircularProgressIndicator(color: AppColors.blue),
          ),
          backgroundColor: Colors.white,
        );
      },
      barrierDismissible: false,
    );
  }

  static void HideLoading(BuildContext context) {
    Navigator.pop(context);
  }

  static void ShowMessage(
    BuildContext context, {
    String? Title,
    String? Content,
    String? PosActionName,
    Function? PosAction,
    String? NigActionName,
    Function? NigAction,
  }) {
    List<Widget> Actions = [];

    if (PosActionName != null) {
      Actions.add(
        TextButton(
          onPressed: () {
            PosAction == null ? Navigator.pop(context) : PosAction.call();
          },
          child: Text(PosActionName, style: AppStyles.normal20Black),
        ),
      );
    }
    if (NigActionName != null) {
      Actions.add(
        TextButton(
          onPressed: () {
            NigAction == null ? Navigator.pop(context) : NigAction.call();
          },
          child: Text(NigActionName, style: AppStyles.normal20Black),
        ),
      );
    }
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(Title ?? "", style: AppStyles.normal20Black),
          content: Text(Content ?? '', style: AppStyles.normal20Black),
          actions: Actions,
          backgroundColor: Colors.white,
        );
      },
    );
  }

  static void showTimeoutDialog(
    BuildContext context,
    VoidCallback onViewScore,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false, // can close by tapping outside
      builder: (context) {
        return PopScope(
          canPop: false, // can close with back button
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            content: SizedBox(
              height: 230,
              width: 280,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image + Text side by side
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.timeOutImage,
                        width: 45,
                        height: 86,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        AppStrings.timeOut,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w400,
                          color: AppColors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  // View Score Button
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: CustmElevatedButton(
                        onpressed: onViewScore,
                        BGcolor: AppColors.blue,
                        text: AppStrings.veiwScore,
                        styleOfChild: AppStyles.Medium16White,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
