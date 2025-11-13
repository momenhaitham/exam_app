abstract class ExamEvents {}

class GetQuestionsEvent extends ExamEvents {
  final String id;
  final String token;

  GetQuestionsEvent({required this.token, required this.id});
}

class GetQuestionsScoreEvent extends ExamEvents {}
