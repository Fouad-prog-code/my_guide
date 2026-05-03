// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_table_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearTableDataDto _$YearTableDataDtoFromJson(Map<String, dynamic> json) =>
    YearTableDataDto(
      yearId: (json['yearId'] as num?)?.toInt(),
      yearName: json['yearName'] as String?,
      schedules: (json['schedules'] as List<dynamic>?)
          ?.map((e) => YearTableScheduleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$YearTableDataDtoToJson(YearTableDataDto instance) =>
    <String, dynamic>{
      'yearId': instance.yearId,
      'yearName': instance.yearName,
      'schedules': instance.schedules,
    };
