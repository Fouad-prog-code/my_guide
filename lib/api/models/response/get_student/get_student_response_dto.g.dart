// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStudentResponseDto _$GetStudentResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetStudentResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => GetStudentDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$GetStudentResponseDtoToJson(
  GetStudentResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
