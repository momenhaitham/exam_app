import 'package:exam_app_project/features/exam/domain/models/answer_item_model.dart';

abstract class ExamEvents {}

class GetQuestionsEvent extends ExamEvents {
  final String id;
  final String token;

  GetQuestionsEvent({required this.token, required this.id});
}

class SelectAnswerEvent extends ExamEvents {
  AnswerItemModel answer;

  SelectAnswerEvent({required this.answer});
}

class SubmitAnswersEvent extends ExamEvents {
  final String token;
  final List<AnswerItemModel> answers;
  SubmitAnswersEvent(this.answers, {required this.token});
}
