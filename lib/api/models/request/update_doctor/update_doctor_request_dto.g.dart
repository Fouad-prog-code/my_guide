// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_doctor_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDoctorRequestDto _$UpdateDoctorRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateDoctorRequestDto(
  id: (json['id'] as num?)?.toInt(),
  nationalId: json['nationalId'] as String?,
  fullName: json['fullName'] as String?,
  username: json['username'] as String?,
  password: json['password'] as String?,
);

Map<String, dynamic> _$UpdateDoctorRequestDtoToJson(
  UpdateDoctorRequestDto instance,
) => <String, dynamic>{
  'id': instance.id,
  'nationalId': instance.nationalId,
  'fullName': instance.fullName,
  'username': instance.username,
  'password': instance.password,
};
