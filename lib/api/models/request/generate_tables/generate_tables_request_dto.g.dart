// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_tables_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenerateTablesRequestDto _$GenerateTablesRequestDtoFromJson(
  Map<String, dynamic> json,
) => GenerateTablesRequestDto(
  dayStartTime: json['dayStartTime'] as String?,
  dayEndTime: json['dayEndTime'] as String?,
  lectureDurationMinutes: (json['lectureDurationMinutes'] as num?)?.toInt(),
  maxLecturesPerDoctorPerDay: (json['maxLecturesPerDoctorPerDay'] as num?)
      ?.toInt(),
  maxLecturesPerYearPerDay: (json['maxLecturesPerYearPerDay'] as num?)?.toInt(),
);

Map<String, dynamic> _$GenerateTablesRequestDtoToJson(
  GenerateTablesRequestDto instance,
) => <String, dynamic>{
  'dayStartTime': instance.dayStartTime,
  'dayEndTime': instance.dayEndTime,
  'lectureDurationMinutes': instance.lectureDurationMinutes,
  'maxLecturesPerDoctorPerDay': instance.maxLecturesPerDoctorPerDay,
  'maxLecturesPerYearPerDay': instance.maxLecturesPerYearPerDay,
};
