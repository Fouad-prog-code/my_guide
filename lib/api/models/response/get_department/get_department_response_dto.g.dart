// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_department_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDepartmentResponseDto _$GetDepartmentResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetDepartmentResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => GetDepartmentDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$GetDepartmentResponseDtoToJson(
  GetDepartmentResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
