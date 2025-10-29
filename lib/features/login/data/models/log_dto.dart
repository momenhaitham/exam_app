// To parse this JSON data, do
//
//     final loginDto = loginDtoFromJson(jsonString);

import 'package:exam_app_project/features/login/domain/models/login_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'user_dto.dart';

part 'log_dto.g.dart';


@JsonSerializable()
class LoginDto {
    @JsonKey(name: "message")
    String? message;
    @JsonKey(name: "token")
    String? token;
    @JsonKey(name: "user")
    User? user;

    LoginDto({
        this.message,
        this.token,
        this.user,
    });

    factory LoginDto.fromJson(Map<String, dynamic> json) => _$LoginDtoFromJson(json);

    Map<String, dynamic> toJson() => _$LoginDtoToJson(this);

    LoginModel toModel(){
      return LoginModel(massage: this.message??"",tokin: this.token);
    }
}

