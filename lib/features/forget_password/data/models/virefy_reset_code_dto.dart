// To parse this JSON data, do
//
//     final virefyResetCodeDto = virefyResetCodeDtoFromJson(jsonString);

import 'package:exam_app_project/features/forget_password/domain/models/virefy_reset_code_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'virefy_reset_code_dto.g.dart';

VirefyResetCodeDto virefyResetCodeDtoFromJson(String str) => VirefyResetCodeDto.fromJson(json.decode(str));

String virefyResetCodeDtoToJson(VirefyResetCodeDto data) => json.encode(data.toJson());

@JsonSerializable()
class VirefyResetCodeDto {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "code")
    int? code;
    @JsonKey(name: "status")
    String? status;

    VirefyResetCodeDto({
        this.message,
        this.code,
        this.status,
    });

    factory VirefyResetCodeDto.fromJson(Map<String, dynamic> json) => _$VirefyResetCodeDtoFromJson(json);

    Map<String, dynamic> toJson() => _$VirefyResetCodeDtoToJson(this);

    VirefyResetCodeModel ToModel (){
      return VirefyResetCodeModel(massage: this.message,status: this.status);
    }
}
