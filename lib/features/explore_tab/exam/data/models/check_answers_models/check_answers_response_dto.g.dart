// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_answers_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckAnswersResponseDto _$CheckAnswersResponseDtoFromJson(
  Map<String, dynamic> json,
) => CheckAnswersResponseDto(
  total: json['total'] as String?,
  message: json['message'] as String?,
  wrongQuestions: (json['WrongQuestions'] as List<dynamic>?)
      ?.map(
        (e) =>
            CorrectOrWrongQuestionResultDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  correctQuestions: (json['correctQuestions'] as List<dynamic>?)
      ?.map(
        (e) =>
            CorrectOrWrongQuestionResultDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
  correct: (json['correct'] as num?)?.toInt(),
  wrong: (json['wrong'] as num?)?.toInt(),
);

Map<String, dynamic> _$CheckAnswersResponseDtoToJson(
  CheckAnswersResponseDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'total': instance.total,
  'WrongQuestions': instance.wrongQuestions,
  'correctQuestions': instance.correctQuestions,
  'correct': instance.correct,
  'wrong': instance.wrong,
};
