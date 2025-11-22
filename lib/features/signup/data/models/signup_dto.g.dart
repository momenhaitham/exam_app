// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupDto _$SignupDtoFromJson(Map<String, dynamic> json) => SignupDto(
  message: json['message'] as String?,
  token: json['token'] as String?,
  user: json['user'] == null
      ? null
      : User.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SignupDtoToJson(SignupDto instance) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'user': instance.user,
};
