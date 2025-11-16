import 'package:exam_app_project/features/exam/domain/models/correct_or_wrong_question_result_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'correct_or_wrong_question_result_dto.g.dart';

@JsonSerializable()
class CorrectOrWrongQuestionResultDto {
  @JsonKey(name: 'QID')
  final String qid;

  @JsonKey(name: 'Question')
  final String question;

  @JsonKey(name: 'correctAnswer')
  final String correctAnswer;

  @JsonKey(name: 'answers')
  final Map<String, dynamic>? answers;

  CorrectOrWrongQuestionResultDto({
    required this.qid,
    required this.question,
    required this.correctAnswer,
    this.answers,
  });

  factory CorrectOrWrongQuestionResultDto.fromJson(Map<String, dynamic> json) =>
      _$CorrectOrWrongQuestionResultDtoFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CorrectOrWrongQuestionResultDtoToJson(this);

  // Convert to a simple domain model
  CorrectOrWrongQuestionResultModel toDomain() {
    return CorrectOrWrongQuestionResultModel(
      id: qid,
      questionText: question,
      correctAnswer: correctAnswer,
    );
  }
}
