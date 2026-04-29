// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataDto _$DataDtoFromJson(Map<String, dynamic> json) => DataDto(
  roomId: (json['roomId'] as num?)?.toInt(),
  roomName: json['roomName'] as String?,
  weeklySchedule: (json['weeklySchedule'] as List<dynamic>?)
      ?.map((e) => WeeklyScheduleDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataDtoToJson(DataDto instance) => <String, dynamic>{
  'roomId': instance.roomId,
  'roomName': instance.roomName,
  'weeklySchedule': instance.weeklySchedule,
};
