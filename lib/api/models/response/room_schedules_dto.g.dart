// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_schedules_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeeklyScheduleDto _$WeeklyScheduleDtoFromJson(Map<String, dynamic> json) =>
    WeeklyScheduleDto(
      dayName: json['dayName'] as String?,
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => LecturesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WeeklyScheduleDtoToJson(WeeklyScheduleDto instance) =>
    <String, dynamic>{
      'dayName': instance.dayName,
      'lectures': instance.lectures,
    };
