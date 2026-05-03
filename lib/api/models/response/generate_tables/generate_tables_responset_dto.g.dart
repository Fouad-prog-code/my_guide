// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_tables_responset_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTablesResponseDto _$GenerateTablesResponseDtoFromJson(
  Map<String, dynamic> json,
) => GenerateTablesResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] as String?,
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$GenerateTablesResponseDtoToJson(
  GenerateTablesResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
