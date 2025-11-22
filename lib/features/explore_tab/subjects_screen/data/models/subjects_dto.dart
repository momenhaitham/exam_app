// To parse this JSON data, do
//
//     final subjectsDto = subjectsDtoFromJson(jsonString);

import 'package:exam_app_project/features/explore_tab/subjects_screen/domain/models/subjects_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'subjects_dto.g.dart';

SubjectsDto subjectsDtoFromJson(String str) => SubjectsDto.fromJson(json.decode(str));

String subjectsDtoToJson(SubjectsDto data) => json.encode(data.toJson());

@JsonSerializable()
class SubjectsDto {
    @JsonKey(name: "subjects")
    List<Subject>? subjects;

    SubjectsDto({
        this.subjects,
    });

    factory SubjectsDto.fromJson(Map<String, dynamic> json) => _$SubjectsDtoFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectsDtoToJson(this);
}

@JsonSerializable()
class Subject {
    @JsonKey(name: "_id")
    String? id;
    @JsonKey(name: "name")
    String? name;
    @JsonKey(name: "icon")
    String? icon;
    @JsonKey(name: "createdAt")
    DateTime? createdAt;

    Subject({
        this.id,
        this.name,
        this.icon,
        this.createdAt,
    });

    factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectToJson(this);

    SubjectsModel ToModel(){
      return SubjectsModel(icon: icon, name: name, id: id);
    }

}

