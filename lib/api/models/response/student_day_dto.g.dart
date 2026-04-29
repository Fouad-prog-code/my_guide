// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_day_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentDayDto _$StudentDayDtoFromJson(Map<String, dynamic> json) =>
    StudentDayDto(
      dayOfWeek: json['dayOfWeek'] as String?,
      lecturesCount: (json['lecturesCount'] as num?)?.toInt(),
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => StudentLectureDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$StudentDayDtoToJson(StudentDayDto instance) =>
    <String, dynamic>{
      'dayOfWeek': instance.dayOfWeek,
      'lecturesCount': instance.lecturesCount,
      'lectures': instance.lectures,
    };
