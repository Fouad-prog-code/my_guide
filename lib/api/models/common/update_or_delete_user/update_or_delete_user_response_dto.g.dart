// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_or_delete_user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateOrDeleteUserResponseDto _$UpdateOrDeleteUserResponseDtoFromJson(
  Map<String, dynamic> json,
) => UpdateOrDeleteUserResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] as String?,
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$UpdateOrDeleteUserResponseDtoToJson(
  UpdateOrDeleteUserResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
