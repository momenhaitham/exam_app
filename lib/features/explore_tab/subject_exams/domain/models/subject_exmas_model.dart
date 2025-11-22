class SubjectExmasModel {
  final List<ExamModel> exams;

  SubjectExmasModel({
    required this.exams,
  });
}

class ExamModel {
  final String? id;
  final String title;
  final int duration;
  final String subject;
  final int numberOfQuestions;
  final bool active;
  final String? createdAt;

  ExamModel({
    this.id,
    required this.title,
    required this.duration,
    required this.subject,
    required this.numberOfQuestions,
    required this.active,
    this.createdAt,
  });
}