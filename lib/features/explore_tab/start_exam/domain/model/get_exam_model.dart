class GetExamModel {
  final String? message;
  final ExamModel exam;

  GetExamModel({
    this.message,
    required this.exam,
  });
}

class ExamModel {
  final String title;
  final int duration;
  final int questionCount;
  final bool active;

  ExamModel({
    required this.title,
    required this.duration,
    required this.questionCount,
    required this.active,
  });
}