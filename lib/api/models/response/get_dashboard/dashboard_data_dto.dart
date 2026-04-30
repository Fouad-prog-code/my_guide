import 'package:json_annotation/json_annotation.dart';
part 'dashboard_data_dto.g.dart';

@JsonSerializable()
class DashboardDataDto {
  @JsonKey(name: "totalUsers")
  final int? totalUsers;
  @JsonKey(name: "totalDoctors")
  final int? totalDoctors;
  @JsonKey(name: "totalSubjects")
  final int? totalSubjects;
  @JsonKey(name: "totalRooms")
  final int? totalRooms;
  @JsonKey(name: "totalGroups")
  final int? totalGroups;

  DashboardDataDto({
    this.totalUsers,
    this.totalDoctors,
    this.totalSubjects,
    this.totalRooms,
    this.totalGroups,
  });

  factory DashboardDataDto.fromJson(Map<String, dynamic> json) {
    return _$DashboardDataDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DashboardDataDtoToJson(this);
  }
}
