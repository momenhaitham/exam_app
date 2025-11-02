// To parse this JSON data, do
//
//     final resetPasswordDto = resetPasswordDtoFromJson(jsonString);

import 'package:exam_app_project/features/forget_password/domain/models/reset_password_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'reset_password_dto.g.dart';

ResetPasswordDto resetPasswordDtoFromJson(String str) => ResetPasswordDto.fromJson(json.decode(str));

String resetPasswordDtoToJson(ResetPasswordDto data) => json.encode(data.toJson());

@JsonSerializable()
class ResetPasswordDto {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "token")
    String? token;
    @JsonKey(name: "code")
    int? code;

    ResetPasswordDto({
        this.message,
        this.token,
        this.code,
    });

    factory ResetPasswordDto.fromJson(Map<String, dynamic> json) => _$ResetPasswordDtoFromJson(json);

    Map<String, dynamic> toJson() => _$ResetPasswordDtoToJson(this);

    ResetPasswordModel ToModel (){
      return ResetPasswordModel(this.message);
    }
}
