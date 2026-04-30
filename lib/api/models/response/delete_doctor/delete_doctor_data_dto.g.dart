// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_doctor_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteDoctorDataDto _$DeleteDoctorDataDtoFromJson(Map<String, dynamic> json) =>
    DeleteDoctorDataDto(
      message: json['message'] as String?,
      orphanedSubjects: (json['orphanedSubjects'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$DeleteDoctorDataDtoToJson(
  DeleteDoctorDataDto instance,
) => <String, dynamic>{
  'message': instance.message,
  'orphanedSubjects': instance.orphanedSubjects,
};
