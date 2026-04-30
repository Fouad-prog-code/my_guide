// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardDataDto _$DashboardDataDtoFromJson(Map<String, dynamic> json) =>
    DashboardDataDto(
      totalUsers: (json['totalUsers'] as num?)?.toInt(),
      totalDoctors: (json['totalDoctors'] as num?)?.toInt(),
      totalSubjects: (json['totalSubjects'] as num?)?.toInt(),
      totalRooms: (json['totalRooms'] as num?)?.toInt(),
      totalGroups: (json['totalGroups'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DashboardDataDtoToJson(DashboardDataDto instance) =>
    <String, dynamic>{
      'totalUsers': instance.totalUsers,
      'totalDoctors': instance.totalDoctors,
      'totalSubjects': instance.totalSubjects,
      'totalRooms': instance.totalRooms,
      'totalGroups': instance.totalGroups,
    };
