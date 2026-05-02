// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_department_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddDepartmentRequestDto _$AddDepartmentRequestDtoFromJson(
  Map<String, dynamic> json,
) => AddDepartmentRequestDto(
  departmentName: json['departmentName'] as String?,
  departmentCode: json['departmentCode'] as String?,
);

Map<String, dynamic> _$AddDepartmentRequestDtoToJson(
  AddDepartmentRequestDto instance,
) => <String, dynamic>{
  'departmentName': instance.departmentName,
  'departmentCode': instance.departmentCode,
};
