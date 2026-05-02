// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_department_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDepartmentRequestDto _$UpdateDepartmentRequestDtoFromJson(
  Map<String, dynamic> json,
) => UpdateDepartmentRequestDto(
  departmentId: (json['departmentId'] as num?)?.toInt(),
  departmentName: json['departmentName'] as String?,
  departmentCode: json['departmentCode'] as String?,
);

Map<String, dynamic> _$UpdateDepartmentRequestDtoToJson(
  UpdateDepartmentRequestDto instance,
) => <String, dynamic>{
  'departmentId': instance.departmentId,
  'departmentName': instance.departmentName,
  'departmentCode': instance.departmentCode,
};
