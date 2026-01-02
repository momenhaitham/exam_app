// features/exam/data/models/question_dto.dart
import 'package:exam_app_project/features/explore_tab/exam/data/models/get_questions_models/answer_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/data/models/get_questions_models/exam_dto.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/exam_info_model.dart';
import 'package:exam_app_project/features/explore_tab/exam/domain/models/question_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_dto.g.dart';

@JsonSerializable()
class QuestionDto {
  @JsonKey(name: '_id')
  final String? id;

  @JsonKey(name: 'question')
  final String? question;

  @JsonKey(name: 'answers')
  final List<AnswerDto>? answers;

  @JsonKey(name: 'type')
  final String? type;

  @JsonKey(name: 'correct')
  final String? correct;

  @JsonKey(name: 'subject')
  final String? subject;

  @JsonKey(name: 'exam')
  final ExamDto? exam;

  @JsonKey(name: 'createdAt')
  final String? createdAt;

  QuestionDto({
    this.id,
    this.question,
    this.answers,
    this.type,
    this.correct,
    this.subject,
    this.exam,
    this.createdAt,
  });

  factory QuestionDto.fromJson(Map<String, dynamic> json) =>
      _$QuestionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDtoToJson(this);

  QuestionModel toDomain() {
    return QuestionModel(
      id: id ?? '',
      questionText: question ?? '',
      answers: answers?.map((dto) => dto.answer ?? '').toList() ?? [],
      correctAnswerKey: correct ?? '',
      type: type ?? '',
      examInfo: ExamInfoModel(
        id: exam?.id??'',
        title: exam?.title ?? '',
        duration: exam?.duration ?? 0,
        numberOfQuestions: exam?.numberOfQuestions ?? 0,
      ),
    );
  }
}
