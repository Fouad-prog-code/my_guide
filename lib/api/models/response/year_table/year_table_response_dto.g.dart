// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_table_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearTableResponseDto _$YearTableResponseDtoFromJson(
  Map<String, dynamic> json,
) => YearTableResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => YearTableDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$YearTableResponseDtoToJson(
  YearTableResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
