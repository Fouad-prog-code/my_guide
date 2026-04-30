import 'package:json_annotation/json_annotation.dart';
import 'package:my_guide/api/models/response/delete_doctor/delete_doctor_data_dto.dart';

part 'delete_doctor_response_dto.g.dart';

@JsonSerializable()
class DeleteDoctorResponseDto {
  @JsonKey(name: "succeeded")
  final bool? succeeded;
  @JsonKey(name: "message")
  final String? message;
  @JsonKey(name: "data")
  final DeleteDoctorDataDto? data;
  @JsonKey(name: "errors")
  final dynamic? errors;
  @JsonKey(name: "statusCode")
  final int? statusCode;
  @JsonKey(name: "meta")
  final dynamic? meta;

  DeleteDoctorResponseDto({
    this.succeeded,
    this.message,
    this.data,
    this.errors,
    this.statusCode,
    this.meta,
  });

  factory DeleteDoctorResponseDto.fromJson(Map<String, dynamic> json) {
    return _$DeleteDoctorResponseDtoFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DeleteDoctorResponseDtoToJson(this);
  }
}
