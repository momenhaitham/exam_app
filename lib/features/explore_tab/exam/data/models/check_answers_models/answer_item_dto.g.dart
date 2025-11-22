// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnswerItemDto _$AnswerItemDtoFromJson(Map<String, dynamic> json) =>
    AnswerItemDto(
      questionId: json['questionId'] as String,
      correct: json['correct'] as String,
    );

Map<String, dynamic> _$AnswerItemDtoToJson(AnswerItemDto instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'correct': instance.correct,
    };
