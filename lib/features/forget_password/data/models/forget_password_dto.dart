// To parse this JSON data, do
//
//     final forgetPasswordDto = forgetPasswordDtoFromJson(jsonString);

import 'package:exam_app_project/features/forget_password/domain/models/forget_password_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'forget_password_dto.g.dart';

ForgetPasswordDto forgetPasswordDtoFromJson(String str) => ForgetPasswordDto.fromJson(json.decode(str));

String forgetPasswordDtoToJson(ForgetPasswordDto data) => json.encode(data.toJson());

@JsonSerializable()
class ForgetPasswordDto {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "info")
    String? info;

    ForgetPasswordDto({
        this.message,
        this.info,
    });

    factory ForgetPasswordDto.fromJson(Map<String, dynamic> json) => _$ForgetPasswordDtoFromJson(json);

    Map<String, dynamic> toJson() => _$ForgetPasswordDtoToJson(this);


    ForgetPasswordModel ToModel (){
      return ForgetPasswordModel(this.message);
    }
}
