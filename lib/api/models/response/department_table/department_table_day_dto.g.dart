// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_table_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentTableDayDto _$DepartmentTableDayDtoFromJson(
  Map<String, dynamic> json,
) => DepartmentTableDayDto(
  dayName: json['dayName'] as String?,
  lectures: (json['lectures'] as List<dynamic>?)
      ?.map(
        (e) => DepartmentTableLecturesDto.fromJson(e as Map<String, dynamic>),
      )
      .toList(),
);

Map<String, dynamic> _$DepartmentTableDayDtoToJson(
  DepartmentTableDayDto instance,
) => <String, dynamic>{
  'dayName': instance.dayName,
  'lectures': instance.lectures,
};
