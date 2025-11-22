import 'package:exam_app_project/features/explore_tab/exam/data/models/check_answers_models/correct_or_wrong_question_result_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/check_answers_result_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_answers_response_dto.g.dart';

@JsonSerializable()
class CheckAnswersResponseDto {
  @JsonKey(name: 'message')
  final String? message;

  @JsonKey(name: 'total')
  final String? total;

  @JsonKey(name: 'WrongQuestions')
  final List<CorrectOrWrongQuestionResultDto>? wrongQuestions; // ← Separate DTO

  @JsonKey(name: 'correctQuestions')
  final List<CorrectOrWrongQuestionResultDto>? correctQuestions; // ← Separate DTO

  @JsonKey(name: 'correct')
  final int? correct;

  @JsonKey(name: 'wrong')
  final int? wrong;

  CheckAnswersResponseDto({
    this.total,
    this.message,
    this.wrongQuestions,
    this.correctQuestions,
    this.correct,
    this.wrong,
  });

  factory CheckAnswersResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckAnswersResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CheckAnswersResponseDtoToJson(this);

  CheckAnswersResultModel toDomain() {
    return CheckAnswersResultModel(
      percentage: total ?? '0%',
      correctQuestions:
          correctQuestions?.map((q) => q.toDomain()).toList() ?? [],
      wrongQuestions: wrongQuestions?.map((q) => q.toDomain()).toList() ?? [],
      message: message ?? '',
      correctCount: correct ?? 0,
      wrongCount: wrong ?? 0,
    );
  }
}
