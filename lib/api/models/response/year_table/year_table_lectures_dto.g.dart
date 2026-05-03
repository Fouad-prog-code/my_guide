// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'year_table_lectures_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YearTableLecturesDto _$YearTableLecturesDtoFromJson(
  Map<String, dynamic> json,
) => YearTableLecturesDto(
  courseName: json['courseName'] as String?,
  doctorName: json['doctorName'] as String?,
  roomName: json['roomName'] as String?,
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
);

Map<String, dynamic> _$YearTableLecturesDtoToJson(
  YearTableLecturesDto instance,
) => <String, dynamic>{
  'courseName': instance.courseName,
  'doctorName': instance.doctorName,
  'roomName': instance.roomName,
  'startTime': instance.startTime,
  'endTime': instance.endTime,
};
