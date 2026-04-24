// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_subject_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubjectResponseDto _$GetSubjectResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetSubjectResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => GetSubjectDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$GetSubjectResponseDtoToJson(
  GetSubjectResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
