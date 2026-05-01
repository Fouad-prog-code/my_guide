// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_manager_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateManagerRequestDto _$UpdateManagerRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateManagerRequestDto(
  managerId: (json['managerId'] as num).toInt(),
  fullName: json['fullName'] as String,
  userName: json['userName'] as String,
  nationalId: json['nationalId'] as String,
);

Map<String, dynamic> _$UpdateManagerRequestDtoToJson(
  UpdateManagerRequestDto instance,
) => <String, dynamic>{
  'managerId': instance.managerId,
  'fullName': instance.fullName,
  'userName': instance.userName,
  'nationalId': instance.nationalId,
};
