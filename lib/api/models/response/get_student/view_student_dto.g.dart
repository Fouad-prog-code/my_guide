// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_student_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewStudentDto _$ViewStudentDtoFromJson(Map<String, dynamic> json) =>
    ViewStudentDto(
      studentName: json['studentName'] as String?,
      userName: json['userName'] as String?,
      departmentName: json['departmentName'],
      studentId: (json['studentId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ViewStudentDtoToJson(ViewStudentDto instance) =>
    <String, dynamic>{
      'studentName': instance.studentName,
      'userName': instance.userName,
      'departmentName': instance.departmentName,
      'studentId': instance.studentId,
    };
