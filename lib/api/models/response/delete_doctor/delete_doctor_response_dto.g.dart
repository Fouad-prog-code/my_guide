// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_doctor_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteDoctorResponseDto _$DeleteDoctorResponseDtoFromJson(
  Map<String, dynamic> json,
) => DeleteDoctorResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DeleteDoctorDataDto.fromJson(json['data'] as Map<String, dynamic>),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$DeleteDoctorResponseDtoToJson(
  DeleteDoctorResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
