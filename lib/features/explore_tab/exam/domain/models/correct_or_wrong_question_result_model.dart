class CorrectOrWrongQuestionResultModel {
  final String id;
  final String questionText;
  final String correctAnswer;
  String? inCorrectAnswer;

  CorrectOrWrongQuestionResultModel({
    required this.id,
    required this.questionText,
    required this.correctAnswer,
    this.inCorrectAnswer
  });
}
