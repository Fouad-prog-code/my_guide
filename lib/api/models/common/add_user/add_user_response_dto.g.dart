// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddUserResponseDto _$AddUserResponseDtoFromJson(Map<String, dynamic> json) =>
    AddUserResponseDto(
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : AddUserDataDto.fromJson(json['data'] as Map<String, dynamic>),
      errors: json['errors'],
      statusCode: (json['statusCode'] as num?)?.toInt(),
      meta: json['meta'],
    );

Map<String, dynamic> _$AddUserResponseDtoToJson(AddUserResponseDto instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
      'meta': instance.meta,
    };
