// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_subject_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddSubjectRequestDto _$AddSubjectRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddSubjectRequestDto(
  lectureName: json['lectureName'] as String?,
  doctorName: json['doctorName'] as String?,
  yearName: json['yearName'] as String?,
  departmentNames: json['departmentNames'] as List<dynamic>?,
);

Map<String, dynamic> _$AddSubjectRequestDtoToJson(
  AddSubjectRequestDto instance,
) => <String, dynamic>{
  'lectureName': instance.lectureName,
  'doctorName': instance.doctorName,
  'yearName': instance.yearName,
  'departmentNames': instance.departmentNames,
};
