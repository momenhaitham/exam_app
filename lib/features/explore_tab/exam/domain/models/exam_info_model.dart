class ExamInfoModel {
  final String title;
  final int duration;
  final int numberOfQuestions;
  final int? correctedQuestions;
  final String? id;


  ExamInfoModel({
    required this.title,
    required this.duration,
    required this.numberOfQuestions,
    this.correctedQuestions,
    required this.id
  });
}
