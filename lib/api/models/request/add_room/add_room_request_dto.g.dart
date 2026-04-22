// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_room_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddRoomRequestDto _$AddRoomRequestDtoFromJson(Map<String, dynamic> json) =>
    AddRoomRequestDto(
      roomName: json['roomName'] as String?,
      capacity: (json['capacity'] as num?)?.toInt(),
      location: json['location'] as String?,
    );

Map<String, dynamic> _$AddRoomRequestDtoToJson(AddRoomRequestDto instance) =>
    <String, dynamic>{
      'roomName': instance.roomName,
      'capacity': instance.capacity,
      'location': instance.location,
    };
