import 'package:exam_app_project/config/Di/di.dart';
import 'package:exam_app_project/config/app_provider/app_provider.dart';
import 'package:exam_app_project/core/app_colors.dart';
import 'package:exam_app_project/core/app_strings.dart';
import 'package:exam_app_project/core/app_styles.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/answer_item_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_events.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_states.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/view_model/exam_view_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/views/screens/exam_score_screen.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/views/widgets/question_option_widget.dart';
import 'package:exam_app_project/features/explore_tab/exam/presentaion/views/widgets/timer_widget.dart';
import 'package:exam_app_project/reuseable_widgets/custm_elevated_button.dart';
import 'package:exam_app_project/reuseable_widgets/error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
    String examId= ModalRoute.of(context)?.settings.arguments as String;
    var provider = Provider.of<AppProvider>(context);
    return BlocProvider<ExamViewModel>(
      create: (context) => viewModel
        ..doIntent(
          GetQuestionsEvent(
            id: examId,
            token:provider.token!
          ),
        ),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,

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
                    child: TimerWidget(
                      timeInMinutes: duration.toString(),
                      onTimeEnded: () {
                        Navigator.pop(context);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExamScoreScreen(
                              numberOfquestions: state.questions!.data!.length,
                              result: state.selectedAnswers ?? [],
                            ),
                          ),
                        );
                      },
                    ),
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
              return CustomErrorWidget();
            }
            // Success State with Data
            else if (!(state.questions?.isLoading ?? false) &&
                state.questions?.data != null &&
                state.questions!.data!.isNotEmpty) {
              final questions = state.questions!.data!;
              final totalQuestions = questions.length;
              final currentQuestion = questions[currentQuestionIndex];
              final selectedAnswers = state.selectedAnswers ?? [];
              return SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Text(
                        currentQuestion.questionText,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: currentQuestion.answers.length * 100,
                        child: ListView.builder(
                          itemCount: currentQuestion.answers.length,
                          itemBuilder: (context, index) {
                            final answerKey = 'A${index + 1}';
                            final selectedAnswer = selectedAnswers.firstWhere(
                              (ans) => ans.questionId == currentQuestion.id,
                              orElse: () => AnswerItemModel(
                                questionId: currentQuestion.id,
                                correct: '',
                              ),
                            );
                            final isSelected =
                                selectedAnswer.correct == answerKey;
                            return QuestionOptionWidget(
                              text: currentQuestion.answers[index],
                              index: index,
                              isSelected: isSelected,
                              onTap: (index) {
                                setState(() {
                                  selectedOption = index;
                                });
                                context.read<ExamViewModel>().doIntent(
                                  SelectAnswerEvent(
                                    answer: AnswerItemModel(
                                      questionId: currentQuestion.id,
                                      correct: answerKey,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 16),
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
                              onpressed: ()async {
                                if (currentQuestionIndex < totalQuestions - 1) {
                                  setState(() {
                                    currentQuestionIndex++;
                                    selectedOption = null;
                                  });
                                } else {
                                  //Todo:save exam info useing hive
                                  ExamInfoModel examInfoModel =  ExamInfoModel(
                                    id: questions[0].examInfo.id,
                                    title: questions[0].examInfo.title, 
                                    duration: questions[0].examInfo.duration, 
                                    numberOfQuestions: questions[0].examInfo.numberOfQuestions,
                                    correctedQuestions: viewModel.answeredQuestions
                                  );
                                  viewModel.doIntent(SaveExamInfo(examInfoModel: examInfoModel));
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ExamScoreScreen(
                                        numberOfquestions:
                                            state.questions!.data!.length,
                                        result: selectedAnswers,
                                      ),
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
            } else if (!(state.questions?.isLoading ?? false) &&
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
