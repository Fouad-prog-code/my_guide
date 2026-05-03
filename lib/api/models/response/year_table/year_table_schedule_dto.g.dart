// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_table_schedule_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearTableScheduleDto _$YearTableScheduleDtoFromJson(
  Map<String, dynamic> json,
) => YearTableScheduleDto(
  dayName: json['dayName'] as String?,
  lectures: (json['lectures'] as List<dynamic>?)
      ?.map((e) => YearTableLecturesDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$YearTableScheduleDtoToJson(
  YearTableScheduleDto instance,
) => <String, dynamic>{
  'dayName': instance.dayName,
  'lectures': instance.lectures,
};
