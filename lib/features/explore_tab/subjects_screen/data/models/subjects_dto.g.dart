// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subjects_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectsDto _$SubjectsDtoFromJson(Map<String, dynamic> json) => SubjectsDto(
  subjects: (json['subjects'] as List<dynamic>?)
      ?.map((e) => Subject.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SubjectsDtoToJson(SubjectsDto instance) =>
    <String, dynamic>{'subjects': instance.subjects};

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
  id: json['_id'] as String?,
  name: json['name'] as String?,
  icon: json['icon'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'icon': instance.icon,
  'createdAt': instance.createdAt?.toIso8601String(),
};
