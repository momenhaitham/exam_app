import 'package:exam_app_project/features/explore_tab/exam/domain/models/correct_or_wrong_question_result_model.dart';

class CheckAnswersResultModel {
  final String percentage;
  final List<CorrectOrWrongQuestionResultModel> wrongQuestions;
  final List<CorrectOrWrongQuestionResultModel> correctQuestions;
  final String message;
  final int correctCount;
  final int wrongCount;

  CheckAnswersResultModel({
    required this.percentage,
    required this.wrongQuestions,
    required this.correctQuestions,
    required this.message,
    required this.correctCount,
    required this.wrongCount,
  });
}
