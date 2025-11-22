import 'dart:developer';

import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/config/app_provider/app_provider.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/answer_item_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_events.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_states.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_view_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/views/widgets/correct_and_incorrect_count_widget.dart';
import 'package:exam_app_project/reuseable_widgets/custm_elevated_button.dart';
import 'package:exam_app_project/reuseable_widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class ExamScoreScreen extends StatelessWidget {
  final List<AnswerItemModel> result;
  final int numberOfquestions;
  ExamScoreScreen({
    super.key,
    required this.result,
    required this.numberOfquestions,
  });
  final ExamViewModel viewModel = getIt<ExamViewModel>();
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);

    log(result.toString());
    return BlocProvider<ExamViewModel>(
      create: (context) {
        log('ExamScoreScreen - Creating ViewModel');
        log('Number of answers: ${result.length}');
        log(
          'Answers: ${result.map((a) => '${a.questionId}: ${a.correct}').join(', ')}',
        );
        return viewModel..doIntent(
          SubmitAnswersEvent(
            result,
            token:
                provider.token!,
          ),
        );
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            AppStrings.examScore,
            style: AppStyles.normal20Black.copyWith(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ExamViewModel, ExamStates>(
            builder: (context, state) {
              if (state.checkAnswersResult!.errorMessage != null &&
                  state.checkAnswersResult!.errorMessage!.isNotEmpty) {
                return CustomErrorWidget();
              } else if (!(state.checkAnswersResult!.isLoading ?? false) &&
                  state.checkAnswersResult?.data != null) {
                final correctCount =
                    state.checkAnswersResult!.data!.correctCount;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.yourScore,
                      style: AppStyles.normal20Black.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 160,
                          height: 160,
                          child: Center(
                            child: CircularPercentIndicator(
                              radius: 70.0,
                              lineWidth: 10.0,
                              percent: correctCount / numberOfquestions,
                              animation: true,
                              center: Text(
                                '${(correctCount / numberOfquestions * 100).toStringAsFixed(2)}%',
                                style: AppStyles.normal20Black.copyWith(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              backgroundColor: AppColors.red,
                              progressColor: AppColors.blue,
                            ),
                          ),
                        ),

                        const SizedBox(width: 24),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CorrectAndIncorrectCountWidget(
                                  text: AppStrings.correct,
                                  count: state
                                      .checkAnswersResult!
                                      .data!
                                      .correctCount
                                      .toString(),
                                  color: AppColors.blue,
                                ),

                                const SizedBox(height: 12),

                                CorrectAndIncorrectCountWidget(
                                  text: AppStrings.incorrect,
                                  count:
                                      (numberOfquestions -
                                              state
                                                  .checkAnswersResult!
                                                  .data!
                                                  .correctCount)
                                          .toString(),
                                  color: AppColors.red,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 100),
                    SizedBox(
                      width: double.infinity,
                      child: CustmElevatedButton(
                        onpressed: () {},
                        BGcolor: AppColors.blue,
                        text: AppStrings.showResults,
                        styleOfChild: AppStyles.Medium16White,
                      ),
                    ),
                    SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: CustmElevatedButton(
                        onpressed: () {},
                        borderColor: AppColors.blue,
                        haseBorder: true,
                        BGcolor: AppColors.white,
                        text: AppStrings.startAgain,
                        styleOfChild: AppStyles.Medium16Blue,
                      ),
                    ),
                  ],
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
