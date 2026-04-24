// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_room_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoomResponseDto _$GetRoomResponseDtoFromJson(Map<String, dynamic> json) =>
    GetRoomResponseDto(
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetRoomDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: json['errors'],
      statusCode: (json['statusCode'] as num?)?.toInt(),
      meta: json['meta'],
    );

Map<String, dynamic> _$GetRoomResponseDtoToJson(GetRoomResponseDto instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
      'meta': instance.meta,
    };
