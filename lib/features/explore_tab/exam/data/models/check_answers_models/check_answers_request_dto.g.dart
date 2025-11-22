// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_answers_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckAnswersRequestDto _$CheckAnswersRequestDtoFromJson(
  Map<String, dynamic> json,
) => CheckAnswersRequestDto(
  answers: (json['answers'] as List<dynamic>)
      .map((e) => AnswerItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CheckAnswersRequestDtoToJson(
  CheckAnswersRequestDto instance,
) => <String, dynamic>{
  'answers': instance.answers.map((e) => e.toJson()).toList(),
};
