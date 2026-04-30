// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorDataDto _$GetDoctorDataDtoFromJson(Map<String, dynamic> json) =>
    GetDoctorDataDto(
      doctorName: json['doctorName'] as String?,
      doctorId: (json['doctorId'] as num?)?.toInt(),
      nationalId: json['nationalId'] as String?,
      userName: json['userName'] as String?,
      lectures: (json['lectures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$GetDoctorDataDtoToJson(GetDoctorDataDto instance) =>
    <String, dynamic>{
      'doctorName': instance.doctorName,
      'doctorId': instance.doctorId,
      'nationalId': instance.nationalId,
      'userName': instance.userName,
      'lectures': instance.lectures,
    };
