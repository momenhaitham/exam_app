
import 'package:exam_app_project/features/start_exam/domain/model/get_exam_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'exam_dto.g.dart';


@JsonSerializable()
class ExamDto {
  final String? message;

  @JsonKey(name: "exam")
  final Exam? exam;

  ExamDto({
    this.message,
    this.exam,
  });

  factory ExamDto.fromJson(Map<String, dynamic> json) =>
      _$ExamDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExamDtoToJson(this);
  
  GetExamModel toModel() {
    return GetExamModel(
      exam: ExamModel(
                    title: exam?.title ?? '',
                    duration: exam?.duration ?? 0,
                    active: exam?.active ?? false,
                    questionCount: exam?.questionCount ?? 0,
                  ));
  }
}

@JsonSerializable()
class Exam {
  @JsonKey(name: "_id")
  final String? id;

  final String? title;
  final int? duration;
  final String? subject;

  @JsonKey(name: "numberOfQuestions")
  final int? questionCount;

  final bool? active;
  final String? createdAt;

  Exam({
    this.id,
    this.title,
    this.duration,
    this.subject,
    this.questionCount,
    this.active,
    this.createdAt,
  });

  factory Exam.fromJson(Map<String, dynamic> json) => _$ExamFromJson(json);

  Map<String, dynamic> toJson() => _$ExamToJson(this);
}
