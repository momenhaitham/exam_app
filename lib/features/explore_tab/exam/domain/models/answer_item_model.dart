class AnswerItemModel {
  final String questionId;
  final String correct;

  AnswerItemModel({required this.questionId, required this.correct});

  @override
  String toString() =>
      'AnswerItemDto(questionId: $questionId, correct: $correct)';
}
