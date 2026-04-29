// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lectures_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LecturesDto _$LecturesDtoFromJson(Map<String, dynamic> json) => LecturesDto(
  subjectName: json['subjectName'] as String?,
  lecturerName: json['lecturerName'] as String?,
  startTime: json['startTime'] as String?,
  endTime: json['endTime'] as String?,
);

Map<String, dynamic> _$LecturesDtoToJson(LecturesDto instance) =>
    <String, dynamic>{
      'subjectName': instance.subjectName,
      'lecturerName': instance.lecturerName,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
