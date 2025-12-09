import 'package:exam_app_project/features/explore_tab/exam/domain/models/saved_question_model.dart';

class ExamInfoModel {
  final String title;
  final int duration;
  final int numberOfQuestions;
  final int? numberOfCorrectedQuestions;
  final String? id;
  final List<String?>? answeredQuestions;
  final List<SavedQuestionModel>? savedQuestions;

  ExamInfoModel({
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    this.numberOfCorrectedQuestions,
    this.savedQuestions,
    this.answeredQuestions,
    required this.id
  });
}
