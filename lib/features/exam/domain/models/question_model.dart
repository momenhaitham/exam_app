import 'package:exam_app_project/features/exam/domain/models/exam_info_model.dart';

class QuestionModel {
  final String id;
  final String questionText;
  final List<String> answers;
  final String correctAnswerKey;
  final String type;
  final ExamInfoModel examInfo;

  QuestionModel({
    required this.id,
    required this.questionText,
    required this.answers,
    required this.correctAnswerKey,
    required this.type,
    required this.examInfo,
  });
}
