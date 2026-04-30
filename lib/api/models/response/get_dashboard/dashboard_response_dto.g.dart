// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardResponseDto _$DashboardResponseDtoFromJson(
  Map<String, dynamic> json,
) => DashboardResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DashboardDataDto.fromJson(json['data'] as Map<String, dynamic>),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$DashboardResponseDtoToJson(
  DashboardResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
