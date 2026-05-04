// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_table_lectures_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentTableLecturesDto _$DepartmentTableLecturesDtoFromJson(
  Map<String, dynamic> json,
) => DepartmentTableLecturesDto(
  courseName: json['courseName'] as String?,
  doctorName: json['doctorName'] as String?,
  roomName: json['roomName'] as String?,
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
);

Map<String, dynamic> _$DepartmentTableLecturesDtoToJson(
  DepartmentTableLecturesDto instance,
) => <String, dynamic>{
  'courseName': instance.courseName,
  'doctorName': instance.doctorName,
  'roomName': instance.roomName,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};
