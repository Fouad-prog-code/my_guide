// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomResponseDto _$RoomResponseDtoFromJson(Map<String, dynamic> json) =>
    RoomResponseDto(
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: json['errors'],
      statusCode: (json['statusCode'] as num?)?.toInt(),
      meta: json['meta'],
    );

Map<String, dynamic> _$RoomResponseDtoToJson(RoomResponseDto instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
      'meta': instance.meta,
    };
