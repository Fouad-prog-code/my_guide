// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_room_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRoomResponseDto _$UpdateRoomResponseDtoFromJson(
  Map<String, dynamic> json,
) => UpdateRoomResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] as String?,
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$UpdateRoomResponseDtoToJson(
  UpdateRoomResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
