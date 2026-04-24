// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_doctor_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetDoctorResponseDto _$GetDoctorResponseDtoFromJson(
  Map<String, dynamic> json,
) => GetDoctorResponseDto(
  succeeded: json['succeeded'] as bool?,
  message: json['message'] as String?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => GetDoctorDataDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  errors: json['errors'],
  statusCode: (json['statusCode'] as num?)?.toInt(),
  meta: json['meta'],
);

Map<String, dynamic> _$GetDoctorResponseDtoToJson(
  GetDoctorResponseDto instance,
) => <String, dynamic>{
  'succeeded': instance.succeeded,
  'message': instance.message,
  'data': instance.data,
  'errors': instance.errors,
  'statusCode': instance.statusCode,
  'meta': instance.meta,
};
