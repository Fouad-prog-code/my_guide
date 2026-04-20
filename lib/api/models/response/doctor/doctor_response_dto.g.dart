// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorResponseDto _$DoctorResponseDtoFromJson(Map<String, dynamic> json) =>
    DoctorResponseDto(
      succeeded: json['succeeded'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DoctorDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: json['errors'],
      statusCode: (json['statusCode'] as num?)?.toInt(),
      meta: json['meta'],
    );

Map<String, dynamic> _$DoctorResponseDtoToJson(DoctorResponseDto instance) =>
    <String, dynamic>{
      'succeeded': instance.succeeded,
      'message': instance.message,
      'data': instance.data,
      'errors': instance.errors,
      'statusCode': instance.statusCode,
      'meta': instance.meta,
    };
