import 'package:exam_app_project/config/base_state/base_state.dart';
import 'package:exam_app_project/features/exam/domain/models/answer_item_model.dart';
import 'package:exam_app_project/features/exam/domain/models/question_model.dart';
import 'package:exam_app_project/features/exam/domain/models/check_answers_result_model.dart';

class ExamStates {
  BaseState<List<QuestionModel>>? questions;
  List<AnswerItemModel>? selectedAnswers;
  BaseState<CheckAnswersResultModel>? checkAnswersResult;

  ExamStates({this.questions, this.selectedAnswers, this.checkAnswersResult});

  ExamStates copyWith({
    BaseState<List<QuestionModel>>? newQuestions,
    List<AnswerItemModel>? newSelectedAnswers,
    BaseState<CheckAnswersResultModel>? newCheckAnswersResult,
  }) {
    return ExamStates(
      questions: newQuestions ?? questions,
      selectedAnswers: newSelectedAnswers ?? selectedAnswers,
      checkAnswersResult: newCheckAnswersResult ?? checkAnswersResult,
    );
  }
}
