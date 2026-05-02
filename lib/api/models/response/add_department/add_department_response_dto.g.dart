// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_department_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDepartmentResponseDto _$AddDepartmentResponseDtoFromJson(
  Map<String, dynamic> json,
) => AddDepartmentResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] as String?,
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$AddDepartmentResponseDtoToJson(
  AddDepartmentResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
