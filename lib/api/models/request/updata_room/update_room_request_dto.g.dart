// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_room_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRoomRequestDto _$UpdateRoomRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateRoomRequestDto(
  roomName: json['roomName'] as String?,
  roomId: (json['roomId'] as num?)?.toInt(),
  capacity: (json['capacity'] as num?)?.toInt(),
  location: json['location'] as String?,
);

Map<String, dynamic> _$UpdateRoomRequestDtoToJson(
  UpdateRoomRequestDto instance,
) => <String, dynamic>{
  'roomName': instance.roomName,
  'roomId': instance.roomId,
  'capacity': instance.capacity,
  'location': instance.location,
};
