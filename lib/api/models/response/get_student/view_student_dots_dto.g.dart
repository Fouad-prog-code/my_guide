// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_student_dots_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewStudentDtosDto _$ViewStudentDtosDtoFromJson(Map<String, dynamic> json) =>
    ViewStudentDtosDto(
      studentName: json['studentName'] as String?,
      userName: json['userName'] as String?,
      departmentName: json['departmentName'],
      studentId: (json['studentId'] as num?)?.toInt(),
      nationalId: json['nationalId'] as String?,
    );

Map<String, dynamic> _$ViewStudentDtosDtoToJson(ViewStudentDtosDto instance) =>
    <String, dynamic>{
      'studentName': instance.studentName,
      'userName': instance.userName,
      'departmentName': instance.departmentName,
      'studentId': instance.studentId,
      'nationalId': instance.nationalId,
    };
