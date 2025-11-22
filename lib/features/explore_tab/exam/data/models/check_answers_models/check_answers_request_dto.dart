import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/answer_item_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_answers_request_dto.g.dart';

@JsonSerializable(explicitToJson: true) // ← ADD THIS
class CheckAnswersRequestDto {
  @JsonKey(name: 'answers')
  final List<AnswerItemDto> answers;

  CheckAnswersRequestDto({required this.answers});

  factory CheckAnswersRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CheckAnswersRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAnswersRequestDtoToJson(this);

  @override
  String toString() => 'CheckAnswersRequestDto(answers: $answers)';
}
