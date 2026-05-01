// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_manager_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetManagerResponseDto _$GetManagerResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetManagerResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  value: (json['value'] as List<dynamic>?)
      ?.map((e) => GetManagerDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  hasValue: json['hasValue'] as bool?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => GetManagerDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$GetManagerResponseDtoToJson(
  GetManagerResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'value': instance.value,
  'hasValue': instance.hasValue,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
