import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/exam/presentaion/view_model/exam_events.dart';
import 'package:exam_app_project/features/exam/presentaion/view_model/exam_states.dart';
import 'package:exam_app_project/features/exam/presentaion/view_model/exam_view_model.dart';
import 'package:exam_app_project/features/exam/presentaion/views/widgets/question_option_widget.dart';
import 'package:exam_app_project/features/exam/presentaion/views/widgets/timer_widget.dart';
import 'package:exam_app_project/reuseable_widgets/custm_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExamScreen extends StatefulWidget {
  const ExamScreen({super.key});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  final ExamViewModel viewModel = getIt<ExamViewModel>();
  int? selectedOption;
  int currentQuestionIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ExamViewModel>(
      create: (context) => viewModel
        ..doIntent(
          GetQuestionsEvent(
            id: '670070a830a3c3c1944a9c63',
            token:
                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTNkMzQyOGZiMTlhZDk1NWIyNmRlNyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYyOTEyMjA4fQ._4nXG40sWDJtzK2r8pFh73gcAGsX267HdC1bRzTlh_c",
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: BlocBuilder<ExamViewModel, ExamStates>(
            builder: (context, state) {
              if (state.questions?.data != null &&
                  state.questions!.data!.isNotEmpty) {
                return Text(
                  state.questions!.data!.first.examInfo.title,
                  style: AppStyles.normal20Black.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                );
              }
              return Text(
                'Exam',
                style: AppStyles.normal20Black.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
          actions: [
            BlocBuilder<ExamViewModel, ExamStates>(
              builder: (context, state) {
                if (state.questions?.data != null &&
                    state.questions!.data!.isNotEmpty) {
                  final duration =
                      state.questions!.data!.first.examInfo.duration;
                  return Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: TimerWidget(timeInMinutes: duration.toString()),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
        body: BlocBuilder<ExamViewModel, ExamStates>(
          builder: (context, state) {
            // Error State
            if (state.questions?.errorMessage != null &&
                state.questions!.errorMessage!.isNotEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.questions!.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ExamViewModel>().doIntent(
                          GetQuestionsEvent(
                            id: '670070a830a3c3c1944a9c63',
                            token:
                                "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY5MTNkMzQyOGZiMTlhZDk1NWIyNmRlNyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzYyOTEyMjA4fQ._4nXG40sWDJtzK2r8pFh73gcAGsX267HdC1bRzTlh_c",
                          ),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            // Success State with Data
            else if (!(state.questions?.isLoading ?? false) &&
                state.questions?.data != null &&
                state.questions!.data!.isNotEmpty) {
              final questions = state.questions!.data!;
              final totalQuestions = questions.length;
              final currentQuestion = questions[currentQuestionIndex];

              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Progress Section
                      Column(
                        children: [
                          Text(
                            '${AppStrings.question} ${currentQuestionIndex + 1} of $totalQuestions',
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
                              value:
                                  (currentQuestionIndex + 1) / totalQuestions,
                              backgroundColor: AppColors.progressIndicatorColor,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.blue,
                              ),
                              minHeight: 6,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Question Text
                      Text(
                        currentQuestion.questionText,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Options List
                      SizedBox(
                        height: currentQuestion.answers.length * 100,
                        child: ListView.builder(
                          itemCount: currentQuestion.answers.length,
                          itemBuilder: (context, index) {
                            return QuestionOptionWidget(
                              text: currentQuestion.answers[index],
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

                      const SizedBox(height: 16),

                      // Navigation Buttons
                      Row(
                        children: [
                          Expanded(
                            child: CustmElevatedButton(
                              onpressed: () {
                                if (currentQuestionIndex > 0) {
                                  setState(() {
                                    currentQuestionIndex--;
                                    selectedOption = null;
                                  });
                                }
                              },
                              text: AppStrings.back,
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
                              padding: const EdgeInsets.symmetric(vertical: 16),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CustmElevatedButton(
                              onpressed: () {
                                if (currentQuestionIndex < totalQuestions - 1) {
                                  setState(() {
                                    currentQuestionIndex++;
                                    selectedOption = null;
                                  });
                                } else {
                                  // Submit exam
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Exam completed!'),
                                    ),
                                  );
                                }
                              },
                              text: currentQuestionIndex < totalQuestions - 1
                                  ? AppStrings.next
                                  : AppStrings.finish,
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
              );
            }
            // Empty State
            else if (!(state.questions?.isLoading ?? false) &&
                state.questions?.data != null &&
                state.questions!.data!.isEmpty) {
              return const Center(child: Text("No Questions Available"));
            }
            // Loading State
            else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
