import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/get_dashboard/dashboard_data_dto.dart';

part 'dashboard_response_dto.g.dart';

@JsonSerializable()
class DashboardResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final DashboardDataDto? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  DashboardResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory DashboardResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DashboardResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DashboardResponseDtoToJson(this);
  }
}
