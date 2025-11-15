abstract class ExamEvents {}

class GetQuestionsEvent extends ExamEvents {
  final String id;
  final String token;

  GetQuestionsEvent({required this.token, required this.id});
}

class SelectAnswerEvent extends ExamEvents {
  final String questionId;
  final String answerKey;

  SelectAnswerEvent({required this.questionId, required this.answerKey});
}

class GetQuestionsScoreEvent extends ExamEvents {}
