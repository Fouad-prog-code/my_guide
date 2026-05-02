// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_department_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDepartmentDataDto _$GetDepartmentDataDtoFromJson(
  Map<String, dynamic> json,
) => GetDepartmentDataDto(
  departmentId: (json['departmentId'] as num?)?.toInt(),
  departmentName: json['departmentName'] as String?,
  departmentCode: json['departmentCode'] as String?,
);

Map<String, dynamic> _$GetDepartmentDataDtoToJson(
  GetDepartmentDataDto instance,
) => <String, dynamic>{
  'departmentId': instance.departmentId,
  'departmentName': instance.departmentName,
  'departmentCode': instance.departmentCode,
};
