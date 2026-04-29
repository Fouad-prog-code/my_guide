// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_doctor_or_manager_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDoctorOrManagerRequestDto _$AddDoctorOrManagerRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddDoctorOrManagerRequestDto(
  userName: json['userName'] as String?,
  password: json['password'] as String?,
  fullName: json['fullName'] as String?,
  nationalId: json['nationalId'] as String?,
);

Map<String, dynamic> _$AddDoctorOrManagerRequestDtoToJson(
  AddDoctorOrManagerRequestDto instance,
) => <String, dynamic>{
  'userName': instance.userName,
  'password': instance.password,
  'fullName': instance.fullName,
  'nationalId': instance.nationalId,
};
