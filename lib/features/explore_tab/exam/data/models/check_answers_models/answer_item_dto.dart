import 'package:exam_app_project/features/explore_tab/exam/domain/models/answer_item_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'answer_item_dto.g.dart';

@JsonSerializable()
class AnswerItemDto {
  @JsonKey(name: 'questionId')
  final String questionId;

  @JsonKey(name: 'correct')
  final String correct;

  AnswerItemDto({required this.questionId, required this.correct});

  factory AnswerItemDto.fromJson(Map<String, dynamic> json) =>
      _$AnswerItemDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AnswerItemDtoToJson(this);

  static AnswerItemDto fromDomain(AnswerItemModel model) {
    return AnswerItemDto(questionId: model.questionId, correct: model.correct);
  }

  @override
  String toString() => ' $questionId $correct)';
}
