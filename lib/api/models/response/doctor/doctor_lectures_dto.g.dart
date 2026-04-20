// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_lectures_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorLecturesDto _$DoctorLecturesDtoFromJson(Map<String, dynamic> json) =>
    DoctorLecturesDto(
      courseName: json['courseName'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      roomName: json['roomName'] as String?,
      gradeName: json['gradeName'] as String?,
    );

Map<String, dynamic> _$DoctorLecturesDtoToJson(DoctorLecturesDto instance) =>
    <String, dynamic>{
      'courseName': instance.courseName,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'roomName': instance.roomName,
      'gradeName': instance.gradeName,
    };
