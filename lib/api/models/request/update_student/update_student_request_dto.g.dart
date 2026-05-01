// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_student_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateStudentRequestDto _$UpdateStudentRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateStudentRequestDto(
  id: (json['id'] as num?)?.toInt(),
  nationalId: json['nationalId'] as String?,
  fullName: json['fullName'] as String?,
  username: json['username'] as String?,
  academicYear: json['academicYear'] as String?,
  department: json['department'] as String?,
);

Map<String, dynamic> _$UpdateStudentRequestDtoToJson(
  UpdateStudentRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'nationalId': instance.nationalId,
  'fullName': instance.fullName,
  'username': instance.username,
  'academicYear': instance.academicYear,
  'department': instance.department,
};
