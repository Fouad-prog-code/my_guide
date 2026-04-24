// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_student_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetStudentDataDto _$GetStudentDataDtoFromJson(Map<String, dynamic> json) =>
    GetStudentDataDto(
      yearName: json['yearName'] as String?,
      viewStudentDtos: (json['viewStudentDtos'] as List<dynamic>?)
          ?.map((e) => ViewStudentDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetStudentDataDtoToJson(GetStudentDataDto instance) =>
    <String, dynamic>{
      'yearName': instance.yearName,
      'viewStudentDtos': instance.viewStudentDtos,
    };
