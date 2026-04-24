// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_room_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteRoomResponseDto _$DeleteRoomResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteRoomResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] as String?,
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$DeleteRoomResponseDtoToJson(
  DeleteRoomResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
