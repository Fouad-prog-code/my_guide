// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_room_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRoomDataDto _$GetRoomDataDtoFromJson(Map<String, dynamic> json) =>
    GetRoomDataDto(
      roomName: json['roomName'] as String?,
      roomId: (json['roomId'] as num?)?.toInt(),
      capacity: (json['capacity'] as num?)?.toInt(),
      location: json['location'],
    );

Map<String, dynamic> _$GetRoomDataDtoToJson(GetRoomDataDto instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'roomId': instance.roomId,
      'capacity': instance.capacity,
      'location': instance.location,
    };
