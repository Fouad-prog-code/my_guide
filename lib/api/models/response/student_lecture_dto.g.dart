// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_lecture_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentLectureDto _$StudentLectureDtoFromJson(Map<String, dynamic> json) =>
    StudentLectureDto(
      subjectName: json['subjectName'] as String?,
      startTime: json['startTime'] as String?,
      endTime: json['endTime'] as String?,
      roomName: json['roomName'] as String?,
      doctorName: json['doctorName'] as String?,
    );

Map<String, dynamic> _$StudentLectureDtoToJson(StudentLectureDto instance) =>
    <String, dynamic>{
      'subjectName': instance.subjectName,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'roomName': instance.roomName,
      'doctorName': instance.doctorName,
    };
