// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorDataDto _$DoctorDataDtoFromJson(Map<String, dynamic> json) =>
    DoctorDataDto(
      dayName: json['dayName'] as String?,
      lecturesCount: (json['lecturesCount'] as num?)?.toInt(),
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => DoctorLecturesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DoctorDataDtoToJson(DoctorDataDto instance) =>
    <String, dynamic>{
      'dayName': instance.dayName,
      'lecturesCount': instance.lecturesCount,
      'lectures': instance.lectures,
    };
