// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_doctor_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDoctorRequestDto _$AddDoctorRequestDtoFromJson(Map<String, dynamic> json) =>
    AddDoctorRequestDto(
      userName: json['userName'] as String?,
      password: json['password'] as String?,
      fullName: json['fullName'] as String?,
      nationalId: json['nationalId'] as String?,
    );

Map<String, dynamic> _$AddDoctorRequestDtoToJson(
  AddDoctorRequestDto instance,
) => <String, dynamic>{
  'userName': instance.userName,
  'password': instance.password,
  'fullName': instance.fullName,
  'nationalId': instance.nationalId,
};
