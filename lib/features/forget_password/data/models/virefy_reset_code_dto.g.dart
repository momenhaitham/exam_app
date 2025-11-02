// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virefy_reset_code_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VirefyResetCodeDto _$VirefyResetCodeDtoFromJson(Map<String, dynamic> json) =>
    VirefyResetCodeDto(
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$VirefyResetCodeDtoToJson(VirefyResetCodeDto instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };
