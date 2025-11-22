import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/reuseable_widgets/custm_elevated_button.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.error,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          CustmElevatedButton(onpressed: () {}, text: "Retry"),
        ],
      ),
    );
  }
}
