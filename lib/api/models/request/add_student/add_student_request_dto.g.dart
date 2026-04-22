// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_student_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddStudentRequestDto _$AddStudentRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddStudentRequestDto(
  fullName: json['fullName'] as String?,
  nationalId: json['nationalId'] as String?,
  password: json['password'] as String?,
  userName: json['userName'] as String?,
  yearName: json['yearName'] as String?,
  deptName: json['deptName'] as String?,
);

Map<String, dynamic> _$AddStudentRequestDtoToJson(
  AddStudentRequestDto instance,
) => <String, dynamic>{
  'fullName': instance.fullName,
  'nationalId': instance.nationalId,
  'password': instance.password,
  'userName': instance.userName,
  'yearName': instance.yearName,
  'deptName': instance.deptName,
};
