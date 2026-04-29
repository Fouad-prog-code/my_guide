// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForgetPasswordRequestDto _$ForgetPasswordRequestDtoFromJson(
  Map<String, dynamic> json,
) => ForgetPasswordRequestDto(
  userName: json['userName'] as String?,
  nationalId: json['nationalId'] as String?,
  newPassword: json['newPassword'] as String?,
);

Map<String, dynamic> _$ForgetPasswordRequestDtoToJson(
  ForgetPasswordRequestDto instance,
) => <String, dynamic>{
  'userName': instance.userName,
  'nationalId': instance.nationalId,
  'newPassword': instance.newPassword,
};
