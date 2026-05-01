// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_manager_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetManagerDataDto _$GetManagerDataDtoFromJson(Map<String, dynamic> json) =>
    GetManagerDataDto(
      managerId: (json['managerId'] as num?)?.toInt(),
      fullName: json['fullName'] as String?,
      userName: json['userName'] as String?,
      nationalId: json['nationalId'] as String?,
    );

Map<String, dynamic> _$GetManagerDataDtoToJson(GetManagerDataDto instance) =>
    <String, dynamic>{
      'managerId': instance.managerId,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'nationalId': instance.nationalId,
    };
