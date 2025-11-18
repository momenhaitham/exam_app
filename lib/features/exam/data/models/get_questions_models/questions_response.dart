import 'package:exam_app_project/features/exam/data/models/get_questions_models/question_dto.dart';
import 'package:json_annotation/json_annotation.dart';
part 'questions_response.g.dart';

@JsonSerializable()
class QuestionResponse {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'questions')
  final List<QuestionDto>? questions;

  QuestionResponse({this.message, this.questions});

  factory QuestionResponse.fromJson(Map<String, dynamic> json) =>
      _$QuestionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionResponseToJson(this);
}
