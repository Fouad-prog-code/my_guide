// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_schedule_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentScheduleResponseDto _$StudentScheduleResponseDtoFromJson(
  Map<String, dynamic> json,
) => StudentScheduleResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => StudentDayDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$StudentScheduleResponseDtoToJson(
  StudentScheduleResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
