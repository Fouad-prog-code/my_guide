// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_table_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentTableDataDto _$DepartmentTableDataDtoFromJson(
  Map<String, dynamic> json,
) => DepartmentTableDataDto(
  departmentName: json['departmentName'] as String?,
  days: (json['days'] as List<dynamic>?)
      ?.map((e) => DepartmentTableDayDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DepartmentTableDataDtoToJson(
  DepartmentTableDataDto instance,
) => <String, dynamic>{
  'departmentName': instance.departmentName,
  'days': instance.days,
};
