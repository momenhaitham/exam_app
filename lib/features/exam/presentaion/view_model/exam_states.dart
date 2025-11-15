import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';

class ExamStates {
  BaseState<List<QuestionModel>>? questions;
  Map<String, String>? selectedAnswers;
  ExamStates({this.questions, this.selectedAnswers});

  ExamStates copyWith({
    BaseState<List<QuestionModel>>? newQuestions,
    Map<String, String>? newSelectedAnswers,
  }) => ExamStates(
    questions: newQuestions ?? questions,
    selectedAnswers: newSelectedAnswers ?? selectedAnswers,
  );
}
