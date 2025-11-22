// To parse this JSON data, do
//
//     final subjectsResponse = subjectsResponseFromJson(jsonString);

import 'package:exam_app_project/features/explore_tab/subjects_screen/data/models/subjects_dto.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'subjects_response.g.dart';

SubjectsResponse subjectsResponseFromJson(String str) => SubjectsResponse.fromJson(json.decode(str));

String subjectsResponseToJson(SubjectsResponse data) => json.encode(data.toJson());

@JsonSerializable()
class SubjectsResponse {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "metadata")
    Metadata? metadata;
    @JsonKey(name: "subjects")
    List<Subject>? subjects;

    SubjectsResponse({
        this.message,
        this.metadata,
        this.subjects,
    });

    factory SubjectsResponse.fromJson(Map<String, dynamic> json) => _$SubjectsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$SubjectsResponseToJson(this);
}

@JsonSerializable()
class Metadata {
    @JsonKey(name: "currentPage")
    int? currentPage;
    @JsonKey(name: "numberOfPages")
    int? numberOfPages;
    @JsonKey(name: "limit")
    int? limit;

    Metadata({
        this.currentPage,
        this.numberOfPages,
        this.limit,
    });

    factory Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

    Map<String, dynamic> toJson() => _$MetadataToJson(this);

    
}

