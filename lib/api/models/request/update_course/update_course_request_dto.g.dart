// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_course_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCourseRequestDto _$UpdateCourseRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateCourseRequestDto(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  doctorName: json['doctorName'] as String?,
  academicYear: json['academicYear'] as String?,
  departments: (json['departments'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$UpdateCourseRequestDtoToJson(
  UpdateCourseRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'doctorName': instance.doctorName,
  'academicYear': instance.academicYear,
  'departments': instance.departments,
};
