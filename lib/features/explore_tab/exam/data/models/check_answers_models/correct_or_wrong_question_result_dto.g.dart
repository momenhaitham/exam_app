// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'correct_or_wrong_question_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CorrectOrWrongQuestionResultDto _$CorrectOrWrongQuestionResultDtoFromJson(
  Map<String, dynamic> json,
) => CorrectOrWrongQuestionResultDto(
  qid: json['QID'] as String,
  question: json['Question'] as String,
  correctAnswer: json['correctAnswer'] as String,
  answers: json['answers'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$CorrectOrWrongQuestionResultDtoToJson(
  CorrectOrWrongQuestionResultDto instance,
) => <String, dynamic>{
  'QID': instance.qid,
  'Question': instance.question,
  'correctAnswer': instance.correctAnswer,
  'answers': instance.answers,
};
