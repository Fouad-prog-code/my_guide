// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_room_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoomResponseDto _$AddRoomResponseDtoFromJson(Map<String, dynamic> json) =>
    AddRoomResponseDto(
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: json['data'] as String?,
      errors: json['errors'],
      statusCode: (json['statusCode'] as num?)?.toInt(),
      meta: json['meta'],
    );

Map<String, dynamic> _$AddRoomResponseDtoToJson(AddRoomResponseDto instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
      'meta': instance.meta,
    };
