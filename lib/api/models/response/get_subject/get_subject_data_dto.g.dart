// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_subject_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubjectDataDto _$GetSubjectDataDtoFromJson(Map<String, dynamic> json) =>
    GetSubjectDataDto(
      id: (json['id'] as num?)?.toInt(),
      subjectName: json['subjectName'] as String?,
      doctorName: json['doctorName'] as String?,
      academicYear: json['academicYear'] as String?,
      departments: (json['departments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetSubjectDataDtoToJson(GetSubjectDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subjectName': instance.subjectName,
      'doctorName': instance.doctorName,
      'academicYear': instance.academicYear,
      'departments': instance.departments,
    };
