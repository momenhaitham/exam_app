import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';

class ExamStates {
  BaseState<List<QuestionModel>>? questions;
  ExamStates({this.questions});

  ExamStates copyWith({BaseState<List<QuestionModel>>? newQuestions}) =>
      ExamStates(questions: newQuestions ?? questions);
}
