// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorDataDto _$GetDoctorDataDtoFromJson(Map<String, dynamic> json) =>
    GetDoctorDataDto(
      doctorName: json['doctorName'] as String?,
      doctorId: (json['doctorId'] as num?)?.toInt(),
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetDoctorDataDtoToJson(GetDoctorDataDto instance) =>
    <String, dynamic>{
      'doctorName': instance.doctorName,
      'doctorId': instance.doctorId,
      'lectures': instance.lectures,
    };
