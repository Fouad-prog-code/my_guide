// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_table_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentTableResponseDto _$DepartmentTableResponseDtoFromJson(
  Map<String, dynamic> json,
) => DepartmentTableResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => DepartmentTableDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$DepartmentTableResponseDtoToJson(
  DepartmentTableResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
