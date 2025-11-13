import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/features/exam/presentaion/views/widgets/question_option_widget.dart';
import 'package:exam_app_project/features/exam/presentaion/views/widgets/timer_widget.dart';
import 'package:exam_app_project/reuseable_widgets/custm_elevated_button.dart';
import 'package:flutter/material.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int? selectedOption;
  int currentQuestion = 1;
  int totalQuestions = 20;
  int remainingSeconds = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text(
          'Exam',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: TimerWidget(timeInSeconds: remainingSeconds.toString()),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress Section
              Column(
                children: [
                  Text(
                    '${AppStrings.question} $currentQuestion of $totalQuestions',
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.gray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: currentQuestion / totalQuestions,
                      backgroundColor: AppColors.progressIndicatorColor,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                      minHeight: 6,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Question Text
              const Text(
                'Select the correctly punctuated sentence.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 24),

              // Options List - Wrapped in Expanded
              SizedBox(
                height: 400,
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return QuestionOptionWidget(
                      text: "text$index",
                      index: index,
                      isSelected: selectedOption == index,
                      onTap: (index) {
                        setState(() {
                          selectedOption = index;
                        });
                      },
                    );
                  },
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: CustmElevatedButton(
                      onpressed: () {
                        if (currentQuestion < totalQuestions) {
                          currentQuestion++;
                          setState(() {});
                        }
                      },
                      text: 'Back',
                      haseBorder: true,
                      borderColor: AppColors.blue,
                      BGcolor: Colors.white,
                      styleOfChild: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      isRouned: false,
                      // Add a border using a Container wrapper
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: CustmElevatedButton(
                      onpressed: () {
                        if (currentQuestion > 1) {
                          currentQuestion--;
                          setState(() {});
                        }
                      },
                      text: 'Next',
                      BGcolor: AppColors.blue,

                      styleOfChild: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      isRouned: false,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
