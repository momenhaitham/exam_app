import 'package:exam_app_project/features/subject_exams/domain/models/subject_exmas_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'subject_exams_dto.g.dart';

@JsonSerializable()
class SubjectExamsDto {
  @JsonKey(name: "message")
  final String? message;

  @JsonKey(name: "metadata")
  final Metadata? metadata;

  @JsonKey(name: "exams")
  final List<ExamsDto>? exams;

  SubjectExamsDto({
    this.message,
    this.metadata,
    this.exams,
  });

  factory SubjectExamsDto.fromJson(Map<String, dynamic> json) =>
      _$SubjectExamsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SubjectExamsDtoToJson(this);

  SubjectExmasModel toModel() {
    return SubjectExmasModel(
      exams: exams
              ?.map((examDto) => ExamModel(
                    title: examDto.title ?? '',
                    duration: examDto.duration ?? 0,
                    subject: examDto.subject ?? '',
                    numberOfQuestions: examDto.numberOfQuestions ?? 0,
                    active: examDto.active ?? false,
                  ))
              .toList() ??
          [],
    );
  }

}

@JsonSerializable()
class Metadata {
  @JsonKey(name: "currentPage")
  final int? currentPage;

  @JsonKey(name: "numberOfPages")
  final int? numberOfPages;

  @JsonKey(name: "limit")
  final int? limit;

  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class ExamsDto {
  @JsonKey(name: "_id")
  final String? sId;

  @JsonKey(name: "title")
  final String? title;

  @JsonKey(name: "duration")
  final int? duration;

  @JsonKey(name: "subject")
  final String? subject;

  @JsonKey(name: "numberOfQuestions")
  final int? numberOfQuestions;

  @JsonKey(name: "active")
  final bool? active;

  @JsonKey(name: "createdAt")
  final String? createdAt;

  ExamsDto({
    this.sId,
    this.title,
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
    this.createdAt,
  });

  factory ExamsDto.fromJson(Map<String, dynamic> json) => _$ExamsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamsDtoToJson(this);


}
