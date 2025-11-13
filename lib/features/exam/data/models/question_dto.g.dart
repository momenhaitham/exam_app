// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionDto _$QuestionDtoFromJson(Map<String, dynamic> json) => QuestionDto(
  id: json['_id'] as String?,
  question: json['question'] as String?,
  answers: (json['answers'] as List<dynamic>?)
      ?.map((e) => AnswerDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  type: json['type'] as String?,
  correct: json['correct'] as String?,
  subject: json['subject'] as String?,
  exam: json['exam'] == null
      ? null
      : ExamDto.fromJson(json['exam'] as Map<String, dynamic>),
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$QuestionDtoToJson(QuestionDto instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'question': instance.question,
      'answers': instance.answers,
      'type': instance.type,
      'correct': instance.correct,
      'subject': instance.subject,
      'exam': instance.exam,
      'createdAt': instance.createdAt,
    };

AnswerDto _$AnswerDtoFromJson(Map<String, dynamic> json) =>
    AnswerDto(answer: json['answer'] as String?, key: json['key'] as String?);

Map<String, dynamic> _$AnswerDtoToJson(AnswerDto instance) => <String, dynamic>{
  'answer': instance.answer,
  'key': instance.key,
};
