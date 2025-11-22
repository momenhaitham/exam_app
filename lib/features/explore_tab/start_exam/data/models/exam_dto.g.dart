// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exam_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExamDto _$ExamDtoFromJson(Map<String, dynamic> json) => ExamDto(
  message: json['message'] as String?,
  exam: json['exam'] == null
      ? null
      : Exam.fromJson(json['exam'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ExamDtoToJson(ExamDto instance) => <String, dynamic>{
  'message': instance.message,
  'exam': instance.exam,
};

Exam _$ExamFromJson(Map<String, dynamic> json) => Exam(
  id: json['_id'] as String?,
  title: json['title'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  subject: json['subject'] as String?,
  questionCount: (json['numberOfQuestions'] as num?)?.toInt(),
  active: json['active'] as bool?,
  createdAt: json['createdAt'] as String?,
);

Map<String, dynamic> _$ExamToJson(Exam instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'duration': instance.duration,
  'subject': instance.subject,
  'numberOfQuestions': instance.questionCount,
  'active': instance.active,
  'createdAt': instance.createdAt,
};
