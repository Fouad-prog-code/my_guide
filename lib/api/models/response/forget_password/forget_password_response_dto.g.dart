// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordResponseDto _$ForgetPasswordResponseDtoFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] as String?,
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$ForgetPasswordResponseDtoToJson(
  ForgetPasswordResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
